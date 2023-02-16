CreateThread(function()
    if Config.EnableOxMySQL then
        GetPlayerData = function(source)
            return exports['oxmysql']:executeSync([[
                SELECT
                    *
                FROM races
                WHERE
                    identifier = :identifier
            ]], {
                ['identifier'] = GetPlayerId(source)
            })[1]
        end

        GetPlayerJob = function(source)
            if Config.EnableQBCore then
                return exports['oxmysql']:scalarSync([[
                    SELECT
                        JSON_EXTRACT(job, '$.name') AS job
                    FROM players
                    WHERE
                        license = :license
                ]], {
                    ['license'] = GetPlayerId(source)
                })
            elseif Config.EnableCustomEvents then
                local promise = promise:new()

                TriggerEvent('rcore_races:getPlayerJob', source, function(job)
                    promise:resolve(job)
                end)

                return Citizen.Await(promise)
            end
        end

        GetLeaderboardData = function()
            return exports['oxmysql']:executeSync([[
                SELECT
                    *
                FROM races
                ORDER BY
                    elo DESC,
                    unitsDriven DESC
            ]])
        end

        IsNicknameUsed = function(nickname)
            return exports['oxmysql']:scalarSync([[
                SELECT
                    nickname
                FROM races
                WHERE
                    nickname = :nickname
            ]], {
                ['nickname'] = nickname
            }) ~= nil
        end

        NewNickname = function(source, nickname)
            return exports['oxmysql']:insertSync([[
                INSERT INTO races
                (
                    identifier, nickname
                )
                VALUES
                (
                    :identifier, :nickname
                )
            ]], {
                ['identifier'] = GetPlayerId(source),
                ['nickname'] = nickname
            })
        end

        UpdateNickname = function(source, nickname)
            return exports['oxmysql']:updateSync([[
                UPDATE races SET
                    nickname = :nickname
                WHERE
                    identifier = :identifier
            ]], {
                ['identifier'] = GetPlayerId(source),
                ['nickname'] = nickname
            })
        end

        UpdateElo = function(identifier, elo)
            return exports['oxmysql']:updateSync([[
                UPDATE races SET
                    elo = :elo
                WHERE
                    identifier = :identifier
            ]], {
                ['identifier'] = identifier,
                ['elo'] = elo
            })
        end

        UpdateDrivenUnits = function(identifier, amount)
            return exports['oxmysql']:updateSync([[
                UPDATE races SET
                    unitsDriven = unitsDriven + :unitsDriven
                WHERE
                    identifier = :identifier
            ]], {
                ['identifier'] = identifier,
                ['unitsDriven'] = amount 
            })
        end

        ResetElo = function()
            return exports['oxmysql']:updateSync([[
                UPDATE races SET
                    elo = 1200
            ]])
        end

        exports['oxmysql']:executeSync([[
            CREATE TABLE IF NOT EXISTS races (
                identifier VARCHAR(255) NOT NULL,
                nickname VARCHAR(80) NULL,
                elo INT DEFAULT 1200,
                unitsDriven FLOAT DEFAULT 0,
                PRIMARY KEY (identifier)
            );
        ]])
    end
end)