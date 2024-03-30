--== CONVERT BY OHDEAR_
--== HARGAI AUTHOR! JANGAN PINDAHIN KE FILE KALIAN

LoadConvert = true

bot = getBot()

function OriName(inputString)
    local cleanedString = inputString:gsub("_[%d]+$", "")
    return cleanedString
end

function OdBot()
    if bot:getEnetStatus() == Connected and bot:getBotStatus() == Success then
        Status = "online"
    elseif bot:getBotStatus() == Suspended then
        Status = "suspended"
    elseif bot:getBotStatus() == Banned then
        Status = "banned"
    elseif bot:getBotStatus() == Wrong_Password then
        Status = "wrong"
    elseif bot:getBotStatus() == Update_Required then
        Status = "update version"
    elseif bot:getBotStatus() == Maintenance then
        Status = "maintenance"
    elseif bot:getBotStatus() == AAP then
        Status = "AAP"
    elseif bot:getBotStatus() == Unable_to_create_new_account then
        Status = "guestError"
    else
        Status = "offline"
    end

    OdLvl = bot:getLocal().level
    
    if OdLvl > 300 then
        OdLvl = 0
    end

    if bot:getLocal().guest then
        nama = OriName(bot:getLocal().name)
    else
        nama = bot:getLocal().name
    end

    return {
        world = bot:getCurrentWorld():upper(),
        name = nama,
        x = bot:getLocal().pos.x,
        y = bot:getLocal().pos.y,
        level = OdLvl,
        status = Status,
        gems = bot:getLocal().gems,
        slots = bot:getLocal().slot,
    }
end

function Waktu(idk)
    curTime = os.time()
    return os.date("!%"..idk, curTime)
end

function CekError(Teks)
    ohdpir = os.time{year=Waktu("Y"), month=Waktu("m"), day=Waktu("d"), hour=Waktu("H"), min=Waktu("M"), sec=Waktu("S")}
    Dovi = ohdpir + (UTC_Time * 3600)
    TimezNow = os.date("%c", Dovi)
    return TimezNow.." : "..Teks
end

function RemoveColors(dovi)
    return string.sub(dovi, 3, -3)
end

function StatusBot()
    if bot:getEnetStatus() == Connected and bot:getBotStatus() == Success then
        Status = "online"
    elseif bot:getBotStatus() == Suspended then
        Status = "suspended"
    elseif bot:getBotStatus() == Banned then
        Status = "banned"
    elseif bot:getBotStatus() == Wrong_Password then
        Status = "wrong"
    elseif bot:getBotStatus() == Update_Required then
        Status = "update version"
    elseif bot:getBotStatus() == Maintenance then
        Status = "maintenance"
    elseif bot:getBotStatus() == AAP then
        Status = "AAP"
    elseif bot:getBotStatus() == Unable_to_create_new_account then
        Status = "guestError"
    else
        Status = "offline"
    end
    return Status
end

function OdBots()
    local MyBot = {}
    for i, v in pairs(getAllBot()) do
        table.insert(MyBot, { 
        name = v:getLocal().name,
        status = StatusBot(v),
        world = v:getCurrentWorld():upper(),
        gems = v:getLocal().gems
    } )
    end
    return MyBot
end

function addOD(id, pass, socks)
    if socks then
        local Splitt = {}
        for w in socks:gmatch("([^:]+)") do 
            table.insert(Splitt, w) 
        end
        Proxy = {
            HostName= Splitt[1]..":"..Splitt[2],
            Username= Splitt[3],
            Password= Splitt[4],
            Type=SOCKS5--SOCKS5/BOTNET
        }
        if not GuestAkun then
            addBot(id, pass, Proxy)
        else
            addGuest(id, Proxy) -- with SOCKS5 and a custom GrowID
        end

    else
        if not GuestAkun then
            addBot(id, pass)
        else
            addGuest(id)
        end
    end
end

function addBod(id, pass, simpan, socks)
    if socks then
        local Splitt = {}
        for w in socks:gmatch("([^:]+)") do 
            table.insert(Splitt, w) 
        end
        Proxy = {
            HostName= Splitt[1]..":"..Splitt[2],
            Username= Splitt[3],
            Password= Splitt[4],
            Type=SOCKS5--SOCKS5/BOTNET
        }
        if not GuestAkun then
            addBot(id, pass, Proxy)
        else
            loginGuest(id, Proxy, simpan) -- with SOCKS5 and a custom GrowID
        end

    else
        if not GuestAkun then
            addBot(id, pass)
        else
            loginGuest(id, simpan)
        end
    end
end 

function findClothes(id)
    if bot:isEquipped(id) then
        return true
    end
    return false
end

function removeBot(id)
    if id == OdBot().name or not id then
        getBot():remove()
    else
        getBot(id):remove()
    end
end

function wear(id)
    packet = {}
    packet.type = 10 
    packet.int_data = id
    bot:sendPacketRaw(packet)
end

function ItsBlock(x, y)
    if bot:isSolid(x, y) and not bot:isSeed(x, y) then
        return true
    end
    return false
end

function getPing()
    return bot:getMs()
end

function findItem(id)
    if id == 112 then
        return OdBot().gems
    end
    item = bot:getItemCount(id)
    if item == nil then
        return 0
    else
        return item
    end
end

function say(od)
    bot:say(od)
end

function findPath(x,y)
    bot:findPath(x,y)
end

function move(arah, speed)
    bot:move(arah, speed)
end

function wrench(x, y)
    bot:wrenchTile(bot:getLocal().pos.x / 32 + x, bot:getLocal().pos.y / 32 + y)
end

function punch(x, y)
    bot:hitTile(bot:getLocal().pos.x / 32 + x, bot:getLocal().pos.y / 32 + y)
end

function place(id, x, y)
    bot:placeTile(bot:getLocal().pos.x / 32 + x, bot:getLocal().pos.y / 32 + y, id)
end

function sendPacket(type, text)
    bot:sendPacket(text, type)
end

function drop(id, count)
    sendPacket(2, "action|drop\n|itemID|"..id)
    if count ~= nil then
        sendPacket(2, "action|dialog_return\ndialog_name|drop_item\nitemID|"..id.."|\ncount|"..count)
    else
        sendPacket(2, "action|dialog_return\ndialog_name|drop_item\nitemID|"..id.."|\ncount|"..findItem(id))
    end
end

function trash(id, count)
    sendPacket(2, "action|trash\n|itemID|"..id)
    if count then
        sendPacket(2, "action|dialog_return\ndialog_name|trash_item\nitemID|"..id.."|\ncount|"..count)
    else
        sendPacket(2, "action|dialog_return\ndialog_name|trash_item\nitemID|"..id.."|\ncount|"..findItem(id))
    end
end

function collectSet(vira, jarak)
    bot:autoCollect(jarak, vira)
end

function connect()
    bot:reConnect()
end

function autoConnect()
    bot:reConnect()
end

function disconnect()
    bot:disconnect()
end

function getTile(x, y)
    tilefg = 0
    tilebg = 0
    tileflags = 0
    tileready = false
    tilefg = bot:getTile(x, y).fg
    tilebg = bot:getTile(x, y).bg
    tileflags = bot:getTile(x, y).flags
    tileready = bot:canHarvest(x, y)
    return {
        fg = tilefg,
        bg = tilebg,
        flags = tileflags,
        ready = tileready,
    }
end

function getInventory()
    local tas = {}
    for _,bag in pairs(bot:getInventory()) do
        table.insert(tas, { id = bag.id, count = bag.count})
    end
    return tas
end

function getPlayers()
    local orang = {}
    for _,ppl in pairs(bot:getPlayers()) do
        table.insert(orang, { name = ppl.name, userid = ppl.userid, netid = ppl.netid, country = ppl.country})
    end
    return orang
end

function getTiles()
    local tiles = {}
    for _,tile in pairs(bot:getTiles()) do
        table.insert(tiles, { x = tile.x, y = tile.y, fg = tile.fg, bg = tile.bg, ready = getTile(tile.x, tile.y).ready, flags = tile.flags})
    end
    return tiles
end

function getObjects()
    local object = {}
    for _,obj in pairs(bot:getObjects()) do
        table.insert(object, { x = obj.pos.x, y = obj.pos.y, id = obj.id, uid = obj.uid, count = obj.count, flags = obj.flags})
    end
    return object
end

function warp(Dunia, Kunci)
    if Kunci then
        bot:warp(Dunia.."|"..Kunci)
    else
        bot:warp(Dunia)
    end
end

function buy(odpack)
    sendPacket(2, "action|buy\nitem|"..odpack)
end

function Upgrades()
    sendPacket(2, "action|buy\nitem|upgrade_backpack")
end

function GetNameID(id)
    return getItemInfo(id).name
end

function collect(range, itemId)
    for _, object in pairs(getObjects()) do
        local posX = math.floor(object.x / 32)
        local posY = math.floor(object.y / 32)
        if bot:isInside(posX, posY, range) then
            if itemId == nil or object.id == itemId then
                bot:collectObject(object.uid)
            end
        end
    end
end
