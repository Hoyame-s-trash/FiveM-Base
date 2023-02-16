CreateThread(function()
    if Config.EnableMySQL then
        GetPlayerData = function(source)
            return MySQL.Sync.fetchAll([[
                SELECT
                    *
                FROM races
                WHERE
                    identifier = @identifier
            ]], {
                ['identifier'] = GetPlayerId(source)
            })[1]
        end

        GetPlayerJob = function(source)
            if Config.EnableESX then
                return MySQL.Sync.fetchScalar([[
                    SELECT
                        job
                    FROM users
                    WHERE
                        identifier = @identifier
                ]], {
                    ['identifier'] = GetPlayerId(source)
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
            return MySQL.Sync.fetchAll([[
                SELECT
                    *
                FROM races
                ORDER BY
                    elo DESC,
                    unitsDriven DESC
            ]])
        end

        IsNicknameUsed = function(nickname)
            return MySQL.Sync.fetchScalar([[
                SELECT
                    nickname
                FROM races
                WHERE
                    nickname = @nickname
            ]], {
                ['nickname'] = nickname
            }) ~= nil
        end

        NewNickname = function(source, nickname)
            return MySQL.Sync.insert([[
                INSERT INTO races
                (
                    identifier, nickname
                )
                VALUES
                (
                    @identifier, @nickname
                )
            ]], {
                ['identifier'] = GetPlayerId(source),
                ['nickname'] = nickname
            })
        end

        UpdateNickname = function(source, nickname)
            return MySQL.Sync.execute([[
                UPDATE races SET
                    nickname = @nickname
                WHERE
                    identifier = @identifier
            ]], {
                ['identifier'] = GetPlayerId(source),
                ['nickname'] = nickname
            })
        end

        UpdateElo = function(identifier, elo)
            return MySQL.Sync.execute([[
                UPDATE races SET
                    elo = @elo
                WHERE
                    identifier = @identifier
            ]], {
                ['identifier'] = identifier,
                ['elo'] = elo
            })
        end

        UpdateDrivenUnits = function(identifier, amount)
            return MySQL.Sync.execute([[
                UPDATE races SET
                    unitsDriven = unitsDriven + @unitsDriven
                WHERE
                    identifier = @identifier
            ]], {
                ['identifier'] = identifier,
                ['unitsDriven'] = amount 
            })
        end

        ResetElo = function()
            return MySQL.Sync.execute([[
                UPDATE races SET
                    elo = 1200
            ]])
        end

        MySQL.ready(function()
            MySQL.Sync.execute([[
                CREATE TABLE IF NOT EXISTS races (
                    identifier VARCHAR(255) NOT NULL,
                    nickname VARCHAR(80) NULL,
                    elo INT DEFAULT 1200,
                    unitsDriven FLOAT DEFAULT 0,
                    PRIMARY KEY (identifier)
                );
            ]])
        end)
    end
end)