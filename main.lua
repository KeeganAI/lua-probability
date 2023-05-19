-- array of possible prizes. 
-- each prize has an ID, an amount, a message, a raw probability, and a function to execute.
local Prizes = {
    {
        id = "markedbills",
        amount = 1,
        message = "general.Marked",
        rawProbability = 0.05,
        give = function(xPlayer, src, prize)
            xPlayer.Functions.AddItem(prize.id, prize.amount)
            TriggerClientEvent("QBCore:Notify", src, Lang:t("success.You_Won") .. Lang:t(prize.message), "success")
        end
    },
    {
        id = "sandwich",
        amount = 10,
        message = "general.Sandwich",
        rawProbability = 0.2,
        give = function(xPlayer, src, prize)
            xPlayer.Functions.AddItem(prize.id, prize.amount)
            TriggerClientEvent("QBCore:Notify", src, Lang:t("success.You_Won") .. Lang:t(prize.message), "success")
        end
    }
    --... Add more prizes here
}


-- Calculate the totalRawProbability by summing the rawProbability of all prizes.
local totalRawProbability = 0
for _, prize in ipairs(Prizes) do
    totalRawProbability = totalRawProbability + prize.rawProbability
end

-- Normalize the rawProbability/ies so that they sum to 1.
for _, prize in ipairs(Prizes) do
    prize.probability = prize.rawProbability / totalRawProbability
end

local function givePrize(xPlayer, src)
    -- Generate a random number between 0 and 1.
    local roll = math.random()
    
    -- variable to hold the cumulative probability.
    local cumulativeProbability = 0

    for _, prize in ipairs(Prizes) do
        -- sum the cumulative probability to the normalized probability.
        cumulativeProbability = cumulativeProbability + prize.probability
        
        -- Check if the random number is less or equal to the cumulative probability.
        -- if it is, this prize is selected.
        if roll <= cumulativeProbability then
            prize.give(xPlayer, src, prize)
            return
            -- if the generated random number is not less than or equal to the cumulative probability for a given prize, 
            -- then that prize is not selected, and the code will move on to the next prize in the list.
        end
    end
end
