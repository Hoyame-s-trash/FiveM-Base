--------------------------------------------------------------------------------

TargetType = {
    NO_TARGET = 0,
    Q_TARGET = 1,
    BT_TARGET = 2,
    QB_TARGET = 3,
    OX_TARGET = 4,
}

TargetTypeResourceName = {
    [TargetType.NO_TARGET] = "none",
    [TargetType.Q_TARGET]  = "qtarget",
    [TargetType.BT_TARGET] = "bt-target",
    [TargetType.QB_TARGET] = "qb-target",
    [TargetType.OX_TARGET] = "ox_target",
}

--------------------------------------------------------------------------------

GameType = {
    NONE = 0,
    BANG_BEAVER = 1,
    FORTUNE_TELLER = 2,
    BALLOON_SHOOTER = 3,
    TARGET_SHOOTER = 4,
    BASKET_THROW = 5,
    ARCADE_CLAW = 6,
}

GameTypeName = {
    [GameType.NONE] = "NONE",
    [GameType.BANG_BEAVER] = "BANG_BEAVER",
    [GameType.FORTUNE_TELLER] = "FORTUNE_TELLER",
    [GameType.BALLOON_SHOOTER] = "BALLOON_SHOOTER",
    [GameType.TARGET_SHOOTER] = "TARGET_SHOOTER",
    [GameType.BASKET_THROW] = "BASKET_THROW",
    [GameType.ARCADE_CLAW] = "ARCADE_CLAW",
}

GameTypeLabel = {
    [GameType.NONE] = "none",
    [GameType.BANG_BEAVER] = "Bang the beaver",
    [GameType.FORTUNE_TELLER] = "Fortune teller",
    [GameType.BALLOON_SHOOTER] = "Balloon shooter",
    [GameType.TARGET_SHOOTER] = "Target shooter",
    [GameType.BASKET_THROW] = "Basket throw",
    [GameType.ARCADE_CLAW] = "Arcade claw"
}

GameTypeObject = {
    [GameType.BANG_BEAVER] = "rcore_bang_beaver",
    [GameType.FORTUNE_TELLER] = "ch_prop_arcade_fortune_01a",
    [GameType.BASKET_THROW] = "rcore_bball_arcade_01",
    [GameType.ARCADE_CLAW] = "ch_prop_arcade_claw_01a",
}

--------------------------------------------------------------------------------

ShooterTargetsObjects = {
    TARGET = GetHashKey("prop_target_red"),
    FORBIDDEN_TARGET = GetHashKey("prop_target_red_cross"),
}

--------------------------------------------------------------------------------

Framework = {
    STANDALONE = 0,
    ESX = 1,
    QBCORE = 2,
}

--------------------------------------------------------------------------------

DifficultyType = {
    EASY = 0,
    MEDIUM = 1,
    HARD = 2,
}

--------------------------------------------------------------------------------

BeaverType = {
    BEAVER_YELLOW = 1,
    BEAVER_BROWN = 2,
    BEAVER_RED = 3,
    BEAVER_GREEN = 4,
}

BeaverTypeObject = {
    [BeaverType.BEAVER_YELLOW] = "rcore_beaver_head_yellow",
    [BeaverType.BEAVER_BROWN] = "rcore_beaver_head_brown",
    [BeaverType.BEAVER_RED] = "rcore_beaver_head_red",
    [BeaverType.BEAVER_GREEN] = "rcore_beaver_head_green",

}

BeaverTypeHashObject = {
    [BeaverType.BEAVER_YELLOW] = GetHashKey("rcore_beaver_head_yellow"),
    [BeaverType.BEAVER_BROWN] = GetHashKey("rcore_beaver_head_brown"),
    [BeaverType.BEAVER_RED] = GetHashKey("rcore_beaver_head_red"),
    [BeaverType.BEAVER_GREEN] = GetHashKey("rcore_beaver_head_green"),
}

--------------------------------------------------------------------------------

BalloonTypes = {
    BALLON_BLUE = "rcore_balloon_blue",
    BALLON_BLUE_SMALL = "rcore_balloon_blue_small",

    BALLON_GREEN = "rcore_balloon_green",
    BALLON_GREEN_SMALL = "rcore_balloon_green_small",

    BALLON_ORANGE = "rcore_balloon_orange",
    BALLON_ORANGE_SMALL = "rcore_balloon_orange_small",

    BALLON_PURPLE = "rcore_balloon_purple",
    BALLON_PURPLE_SMALL = "rcore_balloon_purple_small",

    BALLON_RED = "rcore_balloon_red",
    BALLON_RED_SMALL = "rcore_balloon_red_small",

    BALLON_YELLOW = "rcore_balloon_yellow",
    BALLON_YELLOW_SMALL = "rcore_balloon_yellow_small",
}