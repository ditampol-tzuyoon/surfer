IP_Server_OD = "170.187.197.22"

function JamIni()
    virz = os.date("*t", Dovi)
    return virz.hour
end

function MenitIni()
    virz = os.date("*t", Dovi)
    return virz.min
end

Odirrrr = "https://raw.githubusercontent.com/ditampol-tzuyoon/surfer/main/Image%20Animasi.gif"

LogoPartai = {
    "https://raw.githubusercontent.com/ditampol-tzuyoon/jnck/main/partai/demokrat.png",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/jnck/main/partai/gerindra.png",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/jnck/main/partai/golkar.png",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/jnck/main/partai/nasdem.png",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/jnck/main/partai/pdip.jpeg",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/jnck/main/partai/perindo.png"
}

function ohdmod(logger)

    local ohdpir = os.time{year=Waktu("Y"), month=Waktu("m"), day=Waktu("d"), hour=Waktu("H"), min=Waktu("M"), sec=Waktu("S")}
    local Dovi = ohdpir + (7 * 3600)
    local TimezNow = os.date("%c", Dovi)

    InfoBy = "\\nInfo By <@"..userdc..">"
    TagRole = "<@&1057182557185257522>"
    Warna = 16711680

    local RequestINFO = {}
    RequestINFO.url = modpek
    RequestINFO.json = true
    RequestINFO.method=POST
    RequestINFO.postData = [[
        {
            "embeds": [{
                "description": "]].. logger .." "..InfoBy..[[",
                "color": "]] .. math.random(0, 16777215) .. [[",

                "image": {
                    "url": "]].. Odirrrr ..[["
                },
 
                "footer": {
                    "text": "Script by Ohdear_ \n]]..TimezNow..[["
                }
            }]
        }
    ]]
    httpReq(RequestINFO)
end

function ohdtag(logger)

    local ohdpir = os.time{year=Waktu("Y"), month=Waktu("m"), day=Waktu("d"), hour=Waktu("H"), min=Waktu("M"), sec=Waktu("S")}
    local Dovi = ohdpir + (UTC_Time * 3600)
    local TimezNow = os.date("%c", Dovi)

    if anjynk() ~= nil then
        wkwk = anjynk()
    else
        wkwk = ""
    end

    if OdBot().status == "online" then
        statzBot = ":green_circle:"
        Warna = 7405312
        Ment = ""
    else
        Ment = "<@"..userdc..">"
        statzBot = ":red_circle:"
        Warna = 16711680
    end

    if (ShowMainInfo) or (not HideWebhook) then
        odvr = CekOff(MainHook)

        GetDC = {}

        for vd in string.gmatch(odvr, "[%d]+") do
            table.insert(GetDC, vd)
        end

        MyTeks = "\\n~\\nDETAIL : https://discord.com/channels/"..GetDC[2].."/"..GetDC[1].."/"..HookID
    else
        MyTeks = ""
    end

    local RequestINFO = {}
    RequestINFO.url = PingHook
    RequestINFO.json = true
    RequestINFO.method=POST
    RequestINFO.postData = [[
        {
            "username": "]]..OdBot().name..[[",
            "content": "]]..Ment..[[",
            
            "embeds": [{
                "description": "]].. logger ..[[ ]]..MyTeks..[[",
                "color": "]] .. Warna .. [[",

                "image": {
                    "url": "]].. Odirrrr ..[["
                },

                "footer": {
                    "text": "Masa Aktif : ]]..wkwk..[[\n]]..TimezNow..[["
                }
            }]
        }
    ]]
    httpReq(RequestINFO)
end

function odnotice(logger)

    Ment = "<@"..userdc..">"

    local ohdpir = os.time{year=Waktu("Y"), month=Waktu("m"), day=Waktu("d"), hour=Waktu("H"), min=Waktu("M"), sec=Waktu("S")}
    local Dovi = ohdpir + (UTC_Time * 3600)
    local TimezNow = os.date("%c", Dovi)

    if OdBot().status == "online" then
        statzBot = ":green_circle:"
        Warna = 7405312
    else
        statzBot = ":red_circle:"
        Warna = 16711680
    end

    if anjynk() ~= nil then
        wkwk = anjynk()
    else
        wkwk = ""
    end

    local RequestINFO = {}
    RequestINFO.url = PingHook
    RequestINFO.json = true
    RequestINFO.method=POST
    RequestINFO.postData = [[
        {
            "username": "]]..OdBot().name..[[",
            "content": "]]..Ment..[[",

            "embeds": [{
                "description": "]].. logger ..[[",
                "color": "]] .. Warna .. [[",
                
                "image": {
                    "url": "]].. Odirrrr ..[["
                },

                "footer": {
                    "text": "Masa Aktif : ]]..wkwk..[[\n]]..TimezNow..[["
                }
            }]
        }
    ]]
    httpReq(RequestINFO)
end

function ohdsay(logger, hookURL, Pings)

    Lopar = math.random(1, #LogoPartai)
    Judulz = "Rotasi Farm Surfer ("..versi..") || "..#ListPembeli.." Users. || Author Ohdear_"

    if Pings then
        Ment = "<@"..userdc..">"
    else
        Ment = ""
    end

    if Istirahat then
        TempOff = "\\n~\\n**Bot akan Off Tiap Jam (_" ..InfoTidur().. "_) Selama " .. DelayTidur .. " Menit.**\\n~\\n"
    else
        TempOff = ""
    end

    if block == 4584 then
        Thumbs = "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/pepper.webp"
    elseif block == 5666 then
        Thumbs = "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/LaserGrid.webp"
    elseif block == 3004 then
        Thumbs = "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/ftank.webp"
    elseif block == 340 then
        Thumbs = "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/chand.webp"
    elseif block == 8640 then
        Thumbs = "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/sambalado.webp"
    else
        Thumbs = ""
    end

    AllDelay = "\\n~\\nBreak / Place / HT / Plant / World : **("
    ..delaypnb.." / "..delayplace.." / "..delayht.." / "
    ..delayplant.." / "..delayworld..")**"

    local ohdpir = os.time{year=Waktu("Y"), month=Waktu("m"), day=Waktu("d"), hour=Waktu("H"), min=Waktu("M"), sec=Waktu("S")}
    local Dovi = ohdpir + (UTC_Time * 3600)
    local TimezNow = os.date("%c", Dovi)

    if findClothes(98) then
        PickBotz = ":green_circle: **Pickaxe** (x"..findItem(98)..")"
    else
        PickBotz = ":red_circle: **Pickaxe** (x"..findItem(98)..")"
    end

    WorldSkrg = (OdBot().world):upper()
    if RingkasWorldName then
        Muncul = false
        for _, v in pairs(World) do
            if v:upper() == WorldSkrg then
                Muncul = true
            end
        end
        for _, v in pairs(WorldSeed) do
            if v:upper() == WorldSkrg then
                Muncul = true
            end
        end
        for _, v in pairs(WorldPack) do
            if v:upper() == WorldSkrg then
                Muncul = true
            end
        end
        if WorldAxe:upper() == WorldSkrg then
            Muncul = true
        end
        if Muncul then
            WorldSkrg = WorldSkrg:gsub(string.sub(WorldSkrg, 1, string.len(WorldSkrg) - 3), "")
        end
    end

    if anjynk() ~= nil then
        wkwk = anjynk()
    else
        wkwk = ""
    end

    if OdBot().status == "online" then
        statzBot = ":green_circle:"
        Warna = 7405312
    else
        statzBot = ":red_circle:"
        Warna = 16711680
    end

    if hookURL == MainHook and (not HideWebhook or ShowMainInfo) then

        local RequestINFO = {}
        RequestINFO.url = hookURL.."/messages/"..HookID
        RequestINFO.json = true
        RequestINFO.method=PATCH
        RequestINFO.postData = [[
            {
                "username": "]]..OdBot().name..[[",
                "content": "]]..Ment..[[",

                "embeds": [{
                    "description": "]].. logger ..[[",
                    "color": "]] .. Warna .. [[",

                    "footer": {
                        "text": "Masa Aktif : ]]..wkwk..[[\n]]..TimezNow..[[",
                        "icon_url": "]].. Thumbs ..[["
                    },

                    "thumbnail": {
                        "url": "]].. Thumbs ..[["
                    },

                    "image": {
                        "url": "]].. Odirrrr ..[["
                    },

                    "author": {
                        "name": "]]..Judulz..[[",
                        "url": "https://discord.gg/TjVwdgma74",
                        "icon_url": "]]..LogoPartai[Lopar]..[["
                    },

                    "fields": [
                        {
                            "name": "]]..emot_bot..[[ Bot Name",
                            "value": "]]..OdBot().name..[[ **(Lv ]]..OdBot().level..[[)**",
                            "inline": "false"
                        },

                        {
                            "name": ":earth_asia: Current World",
                            "value": "]]..WorldSkrg..[[",
                            "inline": "true"
                        },
                        {
                            "name": "]]..emot_pickaxe..[[ Tools",
                            "value": "]]..PickBotz..[[",
                            "inline": "true"
                        },


                        {
                            "name": "]]..statzBot..[[ Bot Status",
                            "value": "]]..(OdBot().status):upper()..[[ **(]]..getPing()..[[ Ms)**",
                            "inline": "true"
                        },
                        {
                            "name": "]]..emot_tas..[[ Inventory Slot",
                            "value": "]]..(#getInventory() + 1)..[[/]]..OdBot().slots..[[",
                            "inline": "true"
                        },
                        {
                            "name": "]]..emot_gems..[[ Gems in Backpack",
                            "value": "]]..findItem(112)..[[/]]..hargapack..[[\n]]..AllGems..[[ Gems\n]]..BotRun..[[",
                            "inline": "true"
                        },
                        
                        {
                            "name": ":gem: ]]..GetNameID(FavItem)..[[ in Backpack",
                            "value": "]]..(findItem(FavItem))..[[ Items",
                            "inline": "true"
                        },
                        {
                            "name": "]]..emot_world..[[ World Info",
                            "value": "]]..ShowWorld..[[",
                            "inline": "true"
                        }
                    ]
                }]
            }
        ]]
        local x = httpReq(RequestINFO)

    elseif hookURL == WebhookSeed and (not HideWebhook or ShowSeedInfo) then

        local RequestINFO = {}
        RequestINFO.url = hookURL.."/messages/"..HookIDSeed
        RequestINFO.json = true
        RequestINFO.method=PATCH
        RequestINFO.postData = [[
            {
                "username": "]]..OdBot().name..[[",
                "content": "]]..Ment..[[",

                "embeds": [{
                    "description": "]].. logger ..[[",
                    "color": "]] .. Warna .. [[",

                    "footer": {
                        "text": "Masa Aktif : ]]..wkwk..[[\n]]..TimezNow..[[",
                        "icon_url": "]].. Thumbs ..[["
                    },

                    "thumbnail": {
                        "url": "]].. Thumbs ..[["
                    },

                    "image": {
                        "url": "]].. Odirrrr ..[["
                    },

                    "author": {
                        "name": "]]..Judulz..[[",
                        "url": "https://discord.gg/TjVwdgma74",
                        "icon_url": "]]..LogoPartai[Lopar]..[["
                    },

                    "fields": [
                        {
                            "name": "]]..emot_bot..[[ Bot Name",
                            "value": "]]..OdBot().name..[[ **(]]..getPing()..[[ Ms)**",
                            "inline": "false"
                        },

                        {
                            "name": "]]..emot_world..[[ ]]..GetNameID(seed)..[[",
                            "value": "]]..ShowSeed..[[",
                            "inline": "true"
                        },
                        {
                            "name": "]]..emot_tas..[[ Backpack (Sisa Seed)",
                            "value": "]]..findItem(seed)..[[ ]]..GetNameID(seed)..[[",
                            "inline": "true"
                        },

                        {
                            "name": ":timer: Bot Active",
                            "value": "]]..BotRun..[[",
                            "inline": "false"
                        }
                    ]
                }]
            }
        ]]
        local x = httpReq(RequestINFO)
    elseif hookURL == WebhookPack and (not HideWebhook or ShowPackInfo) then

        local RequestINFO = {}
        RequestINFO.url = hookURL.."/messages/"..HookIDPack
        RequestINFO.json = true
        RequestINFO.method=PATCH
        RequestINFO.postData = [[
            {
                "username": "]]..OdBot().name..[[",
                "content": "]]..Ment..[[",
                
                "embeds": [{
                    "description": "]].. logger ..[[",
                    "color": "]] .. Warna .. [[",

                    "footer": {
                        "text": "Masa Aktif : ]]..wkwk..[[\n]]..TimezNow..[[",
                        "icon_url": "]].. Thumbs ..[["
                    },

                    "thumbnail": {
                        "url": "]].. Thumbs ..[["
                    },

                    "image": {
                        "url": "]].. Odirrrr ..[["
                    },

                    "author": {
                        "name": "]]..Judulz..[[",
                        "url": "https://discord.gg/TjVwdgma74",
                        "icon_url": "]]..LogoPartai[Lopar]..[["
                    },

                    "fields": [
                        {
                            "name": "]]..emot_bot..[[ Bot Name",
                            "value": "]]..OdBot().name..[[ **(]]..getPing()..[[ Ms)**",
                            "inline": "false"
                        },

                        {
                            "name": "]]..emot_pack..[[ ]]..namapack:upper()..[[",
                            "value": "]]..ShowPack..[[",
                            "inline": "true"
                        },
                        {
                            "name": ":timer: Bot Active",
                            "value": "]]..BotRun..[[",
                            "inline": "true"
                        }
                    ]
                }]
            }
        ]]
        httpReq(RequestINFO)
    end
end
