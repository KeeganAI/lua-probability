-- array of possible prizes. 
-- each prize has an ID, an amount, a message and a raw probability
local Prizes = {
    { 
        id = "markedbills", 
        amount = 1, 
        message = "general.Marked", 
        rawProbability = 0.05 
    },
    { 
        id = "sandwich", 
        amount = 10, 
        message = "general.Sandwich", 
        rawProbability = 0.2 
    }
    --... Add more prizes here
}

-- function used to give the prize to the player
-- function to execute in the end
local function givePrizeToPlayer(player, source, prize)
    player.Functions.AddItem(prize.id, prize.amount)
    TriggerClientEvent("QBCore:Notify", source, Lang:t("success.You_Won") .. Lang:t(prize.message), "success")
end

-- function that calculates the total raw probability
local function calculateTotalRawProbability(prizes)
    local total = 0
    for _, prize in ipairs(prizes) do
        total = total + prize.rawProbability
    end
    return total
end

-- function that normalizes the raw probabilities
local function normalizeRawProbabilities(prizes, totalRawProbability)
    if totalRawProbability == 0 then
        error("total raw probability is 0, check prizes!")
    end
    for _, prize in ipairs(prizes) do
        prize.probability = prize.rawProbability / totalRawProbability
    end
end

local function givePrize(player, source)
    local roll = math.random()
    local cumulativeProbability = 0

    for _, prize in ipairs(Prizes) do
        cumulativeProbability = cumulativeProbability + prize.probability
        if roll <= cumulativeProbability then
            givePrizeToPlayer(player, source, prize)
            return
        end
    end
end

-- calculate the probabilities
local totalRawProbability = calculateTotalRawProbability(Prizes)
normalizeRawProbabilities(Prizes, totalRawProbability)
