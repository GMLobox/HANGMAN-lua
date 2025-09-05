-- hangman thingy thing by EMMANUEL CASTREJON @GMLobox (YT, TWITTER) and https://squishhxd.itch.io

-- ts gonna be sooooo tuff

local misses = 1
local wordTable = { "yeah", "that", "big", "about", "apple", "jentacular", "gerrymandering",}

local Word = wordTable[math.random(1, #wordTable)]

local tableWord = {}
for index=1,#Word do
    tableWord[index] = Word:sub(index, index)
end

local correctWord = {}
local alphabet = {}

-- init
for index=1, #tableWord do
    correctWord[index] = "_"
end

-- functions
local tableToString = function(table)
    local evilString = ""
    
    for _, s in ipairs(table) do
        evilString = evilString..s
    end
    return evilString
end

local tableFindValue = function(table, value)
    local instancesTable = {}
    
    for key, instance in pairs(table) do
        if instance == value then
            local keyTable = { key, instance }
            instancesTable[#instancesTable+1] = keyTable
        end
    end
    
    if instancesTable ~= {} then return instancesTable end
end

local miss1 = {
    "    XXXXXXXXXXXX              ",
    "    X          X              ",
    "    X          X              ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    " XXXXXXX                      "
    
}

local miss2 = {
    "    XXXXXXXXXXXX              ",
    "    X          X              ",
    "    X          X              ",
    "    X         ┌┬┐             ",
    "    X        ┌   ┐            ",
    "    X       ├     ┤           ",
    "    X        └   ┘            ",
    "    X         └┴┘             ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    " XXXXXXX                      "
    
}

local miss4 = {
    "    XXXXXXXXXXXX              ",
    "    X          X              ",
    "    X          X              ",
    "    X         ┌┬┐             ",
    "    X        ┌   ┐            ",
    "    X       ├     ┤           ",
    "    X     [] └   ┘            ",
    "    X       [[└┴┘             ",
    "    X         [║              ",
    "    X          ║              ",
    "    X          ║              ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    " XXXXXXX                      "
    
}

local miss3 = {
    "    XXXXXXXXXXXX              ",
    "    X          X              ",
    "    X          X              ",
    "    X         ┌┬┐             ",
    "    X        ┌   ┐            ",
    "    X       ├     ┤           ",
    "    X        └   ┘            ",
    "    X         └┴┘             ",
    "    X          ║              ",
    "    X          ║              ",
    "    X          ║              ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    " XXXXXXX                      "
    
}

local miss5 = {
    "    XXXXXXXXXXXX              ",
    "    X          X              ",
    "    X          X              ",
    "    X         ┌┬┐             ",
    "    X        ┌   ┐            ",
    "    X       ├     ┤           ",
    "    X     [] └   ┘ []         ",
    "    X       [[└┴┘]]           ",
    "    X         [║]             ",
    "    X          ║              ",
    "    X          ║              ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    " XXXXXXX                      "
    
}

local miss6 = {
    "    XXXXXXXXXXXX              ",
    "    X          X              ",
    "    X          X              ",
    "    X         ┌┬┐             ",
    "    X        ┌   ┐            ",
    "    X       ├     ┤           ",
    "    X     [] └   ┘ []         ",
    "    X       [[└┴┘]]           ",
    "    X         [║]             ",
    "    X          ║              ",
    "    X          ║              ",
    "    X          ▓              ",
    "    X         ▓              ",
    "    X        ▓               ",
    "    X       ▓                ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    " XXXXXXX                      "
    
}

local miss7 = {
    "    XXXXXXXXXXXX              ",
    "    X          X              ",
    "    X          X              ",
    "    X         ┌┬┐             ",
    "    X        ┌   ┐            ",
    "    X       ├     ┤           ",
    "    X     [] └   ┘ []         ",
    "    X       [[└┴┘]]           ",
    "    X         [║]             ",
    "    X          ║              ",
    "    X          ║              ",
    "    X          ▓              ",
    "    X         ▓ ▓             ",
    "    X        ▓   ▓            ",
    "    X       ▓     ▓           ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    "    X                         ",
    " XXXXXXX                      "
    
}

-- main routine
while (misses <= 6) and (tableToString(tableWord) ~= tableToString(correctWord)) do
    -- print the Schtuff
    local misstext={miss1,miss2,miss3,miss4,miss5,miss6, {}}
    for _, str in ipairs(misstext[misses]) do
       print(str) 
    end
    print("")
    print(tableToString(correctWord))
    print("Alphabet: "..tableToString(alphabet))
    
    print("Enter a letter: ")
    local response = io.read()
    
    -- result routine
    if string.len(response) == 1 then
        
        if #tableFindValue(alphabet, response) ~= 0 then -- anti-parrot catcher
            print("little bro "..response.." was already said")
        else
            -- miss check
            local miss = true
            for _, inst in ipairs(tableFindValue(tableWord, response)) do
                correctWord[inst[1]] = response
                miss = false
            end
            
            alphabet[#alphabet+1] = response -- add it to the alphabet that was already said
            if miss then -- win/fail condition
               misses = misses+1
               if misses == 7 then for _,str in ipairs(miss7) do print(str) end print("Game over!") end
            elseif tableToString(tableWord) == tableToString(correctWord) then print("You won! #Alrighty") end
        end
    else
        print("please enter a LETTER, not mumbo jumbo")
    end
end