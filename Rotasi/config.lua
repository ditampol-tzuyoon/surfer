if ShowIP then
    Lihatin = "Lihatin"
else
    Lihatin = "Gak"
end

RandomChat = {
    "`cOhdear Store `2Awalnya hanya tersedia di Facebook!",
    "`2Awalnya dikenal dengan sebutan `cPabrik Lgrid",
    "`2Ketika masih v1 harganya hanya `c50 DLs `2aja",
    "`2Buyer Pertama? `cOwner`2pun Lupa Orangnya",
    "`2700K `4Drop to `2320K! `cFeb 23",
    "`2Scr1pt ini telah ada semenjak jaman `cATOM! `2User Teo juga",
    "`2Benwep muncul ketika boomingnya `cRotasi Farm",
    "`224Jam? `cJaman Teo cuman dikenal Pabrik Basic Seed.",
    "`2Hamem3k dan Seth4n `cJika Kenal Nick tsb, berarti anda player lama."
}

RandomEmot = {
    "love",
    "omg",
    "troll",
    "wow",
    "dance"
}

function Waktu(idk)
    curTime = os.time()
    return os.date("!%"..idk, curTime)
end

function JamIni()
    virz = os.date("*t", Dovi)
    return virz.hour
end

function MenitIni()
    virz = os.date("*t", Dovi)
    return virz.min
end

function Method()
    say(RandomChat[math.random(1, #RandomChat)])
    sleep(500)
    say("/"..RandomEmot[math.random(1, #RandomEmot)])
end

function StatusAktif(yoopo)
    odv = 0
    for _, v in pairs(OdBots()) do
        if v.status == yoopo then
            odv = odv + 1
        end
    end
    return odv
end

function SemuaGems()
    odv = 0
    for _, v in pairs(OdBots()) do
        if v.status == "online" then
            odv = odv + v.gems
        end
    end
    return odv
end

if Jastip then
	Gajian = true
end

LogoPartai = {
    "https://raw.githubusercontent.com/ditampol-tzuyoon/jnck/main/partai/demokrat.png",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/jnck/main/partai/gerindra.png",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/jnck/main/partai/golkar.png",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/jnck/main/partai/nasdem.png",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/jnck/main/partai/pdip.jpeg",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/jnck/main/partai/perindo.png"
}

RandomChat = {
    "`cOhdear Store `2Awalnya hanya tersedia di Facebook!",
    "`2Awalnya dikenal dengan sebutan `cPabrik Lgrid",
    "`2Ketika masih v1 harganya hanya `c50 DLs `2aja",
    "`2Buyer Pertama? `cOwner`2pun Lupa Orangnya",
    "`2700K `4Drop to `2320K! `cFeb 23",
    "`2Scr1pt ini telah ada semenjak jaman `cATOM! `2User Teo juga",
    "`2Benwep muncul ketika boomingnya `cRotasi Farm",
    "`224Jam? `cJaman Teo cuman dikenal Pabrik Basic Seed.",
    "`2Hamem3k dan Seth4n `cJika Kenal Nick tsb, berarti anda player lama."
}

Lopar = math.random(1, #LogoPartai)

function ohdtag(logger)

    if not HideWebhook or ShowPingHook then

        ohdpir = os.time{year=Waktu("Y"), month=Waktu("m"), day=Waktu("d"), hour=Waktu("H"), min=Waktu("M"), sec=Waktu("S")}
        Dovi = ohdpir + (UTC_Time * 3600)
        TimezNow = os.date("%c", Dovi)
	
        if OdBot().status ~= "online" then
            if Jastip then
                Ment = "<@".. userdc .."> <@&".. UserID_Role ..">"
            else
                Ment = "<@".. userdc ..">"
            end
        else
            Ment = ""
        end
            
        if OdBot().status == "online" then
            statzBot = ":green_circle:"
            Warna = 7405312
        else
            statzBot = ":red_circle:"
            Warna = 16711680
        end
        
        kalimatku = "\n~\nLINK INFO: "
        chinfo = "\nCHANNEL:"
        local script = [[
            $gethook = "]]..MainHook..[["
            $w = "]]..PingHook..[["

            [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
            $ambilhook = Invoke-RestMethod -Uri $gethook -Method GET
            $chid = $ambilhook.channel_id
            $guid = $ambilhook.guild_id
            $hukid = "]]..HookID..[["
            $Morez = "https://discord.com/channels/" + $guid + "/" + $chid + "/" + $hukid

            [System.Collections.ArrayList]$embedArray = @()
            $descriptions = ']].. logger ..[[ ]].. kalimatku ..[[' + $Morez + ']].. chinfo ..[[ <#' + $chid + '>'
            $color       = ']]..Warna..[['

            $footerObject = [PSCustomObject]@{
                text = 'Ohdear2320' + "`n" + ']]..TimezNow..[['
            }

            $embedObject = [PSCustomObject]@{
                description = $descriptions
                color       = $color
                footer      = $footerObject
            }

            $embedArray.Add($embedObject) | Out-Null

            $Body = [PSCustomObject]@{
                embeds = $embedArray
                'username' = ']]..OdBot().name..[[|OD2320'
                'content' = ']]..Ment..[['
            }

            Invoke-RestMethod -Uri $w -Body ($Body | ConvertTo-Json -Depth 4) -Method Post -ContentType 'application/json'
        ]]

        local pipe = io.popen("powershell -command -", "w")
        pipe:write(script)
        pipe:close()
    end
end

function ohdmod(logger)

    InfoBy = "\nInfo By <@" .. userdc .. ">"
    TagRole = "<@&1057182557185257522>"
    Warna = 16711680

    ohdpir = os.time{year=Waktu("Y"), month=Waktu("m"), day=Waktu("d"), hour=Waktu("H"), min=Waktu("M"), sec=Waktu("S")}
    Dovi = ohdpir + (UTC_Time * 3600)
    TimezNow = os.date("%c", Dovi)
        
    local script = [[
        $w = "]]..modpek..[["

        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

        [System.Collections.ArrayList]$embedArray = @()
        $descriptions = ']].. logger ..[[ ]]..InfoBy..[['
        $color       = ']]..Warna..[['

        $footerObject = [PSCustomObject]@{
            text = 'Ohdear2320' + "`n" + ']]..TimezNow..[['
        }

        $embedObject = [PSCustomObject]@{
            description = $descriptions
            color       = $color
            footer      = $footerObject
        }

        $embedArray.Add($embedObject) | Out-Null

        $Body = [PSCustomObject]@{
            embeds = $embedArray
            'username' = 'ModsMmk | Od2320'
            'content' = ']]..TagRole..[['
        }

        Invoke-RestMethod -Uri $w -Body ($Body | ConvertTo-Json -Depth 4) -Method Post -ContentType 'application/json'
    ]]

    local pipe = io.popen("powershell -command -", "w")
    pipe:write(script)
    pipe:close()
end

function odnotice(logger)

        ohdpir = os.time{year=Waktu("Y"), month=Waktu("m"), day=Waktu("d"), hour=Waktu("H"), min=Waktu("M"), sec=Waktu("S")}
        Dovi = ohdpir + (UTC_Time * 3600)
        TimezNow = os.date("%c", Dovi)
	
        if OdBot().status == "online" then
            statzBot = ":green_circle:"
            Warna = 7405312
        else
            statzBot = ":red_circle:"
            Warna = 16711680
        end

        if Jastip then
            if userdc then
                Mention = "<@".. userdc .."> <@&".. UserID_Role ..">"
            else
                Mention = ""
            end
        else
            if userdc then
                Mention = "<@"..userdc..">"
            else
                Mention = ""
            end
        end

        local script = [[
            $w = "]]..PingHook..[["

            [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

            [System.Collections.ArrayList]$embedArray = @()
            $descriptions = ']].. logger ..[['
            $color       = ']]..Warna..[['

            $footerObject = [PSCustomObject]@{
                text = 'Ohdear2320' + "`n" + ']]..TimezNow..[['
            }

            $embedObject = [PSCustomObject]@{
                description = $descriptions
                color       = $color
                footer      = $footerObject
            }

            $embedArray.Add($embedObject) | Out-Null

            $Body = [PSCustomObject]@{
                embeds = $embedArray
                'username' = ']]..OdBot().name..[[ | OD2320'
                'content' = ']]..Mention..[['
            }

            Invoke-RestMethod -Uri $w -Body ($Body | ConvertTo-Json -Depth 4) -Method Post -ContentType 'application/json'
        ]]

        local pipe = io.popen("powershell -command -", "w")
        pipe:write(script)
        pipe:close()
  
end

math.randomseed(os.time())

function odplant(logger)

if not HideWebhook or ShowPlantHook then

    ohdpir = os.time{year=Waktu("Y"), month=Waktu("m"), day=Waktu("d"), hour=Waktu("H"), min=Waktu("M"), sec=Waktu("S")}
    Dovi = ohdpir + (UTC_Time * 3600)
    TimezNow = os.date("%c", Dovi)

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

	TanamWorld = "Planting ("..nPlant.." of "..#WorldPlant.." Worlds)"
    Warna = 7405312
    Banteng = math.random(1, #LogoPartai)

    SendPlant = PlantHook.."/messages/"..PlantMsg

    local script = [[
        $w = "]]..SendPlant..[["

        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

        [System.Collections.ArrayList]$embedArray = @()
        $descriptions = ']].. logger ..[['
        $color       = ']]..Warna..[['

        $footerObject = [PSCustomObject]@{
            text = 'Bonus Planting' + "`n" + "`n" + ']]..TimezNow..[['
            icon_url = ']].. Thumbs ..[['
        }

        $thumbnailObject = [PSCustomObject]@{
            url = ']].. Thumbs ..[['
        }

        $authorObject = [PSCustomObject]@{
            name = "Continue Plant || Author : Ohdear#2320"
            url = "https://discord.gg/TjVwdgma74"
            icon_url = "]]..LogoPartai[Banteng]..[["
        }

        $fieldArray = @(

            @{
                name = "]]..TanamWorld..[["
                value = "]]..IngfoPlant()..[["
                inline = "false"
            }
        )

        $embedObject = [PSCustomObject]@{
            description = $descriptions
            color       = $color
            footer      = $footerObject
            thumbnail   = $thumbnailObject
            author      = $authorObject
            fields      = $fieldArray
        }

        $embedArray.Add($embedObject) | Out-Null

        $Body = [PSCustomObject]@{
            embeds = $embedArray
            'username' = ']]..OdBot().name..[[ | OD2320'
        }

        Invoke-RestMethod -Uri $w -Body ($Body | ConvertTo-Json -Depth 4) -Method Patch -ContentType 'application/json'
    ]]

    local pipe = io.popen("powershell -command -", "w")
    pipe:write(script)
    pipe:close()
    end
end

function ohdsay(logger, hookURL, Pings)

    if namapack == "crackers" then
        Winter = "\n~\n>> Happy Christmas! Crackers Bought **("..EventBuy.." of 20)**"
    else
        Winter = ""
    end
        
    if LinkImage then
        imagez = LinkImage
    else
        imagez = ""
    end

    Judulz = "Rotasi Farm Surfer ("..versi..") || "..#ListPembeli.." Users."

    if Pings then
        ingfo = "<@" .. userdc .. ">"
    else
        ingfo = ""
    end

    ohdpir = os.time{year=Waktu("Y"), month=Waktu("m"), day=Waktu("d"), hour=Waktu("H"), min=Waktu("M"), sec=Waktu("S")}
    Dovi = ohdpir + (UTC_Time * 3600)
    TimezNow = os.date("%c", Dovi)

    if Istirahat then
        TempOff = "\n~\n**Bot akan Off Tiap Jam (_" ..InfoTidur().. "_) Selama " .. DelayTidur .. " Menit.**\n~\n"
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

    if OdBot().status == "online" then
        statzBot = ":green_circle:"
        Warna = 7405312
    else
        statzBot = ":red_circle:"
        Warna = 16711680
    end


    if findClothes(98) then
        PickBotz = ":green_circle: **Pickaxe** (x"..findItem(98)..")"
    else
        PickBotz = ":red_circle: **Pickaxe** (x"..findItem(98)..")"
    end

    if ChangeBot then
        targetlv = "("..OdBot().level.."/"..targetlevel..")"
    else
        targetlv = OdBot().level
    end

AllDelay = "\n~\nBreak / Place / HT / Plant / World : **("
..delaypnb.." / "..delayplace.." / "..delayht.." / "
..delayplant.." / "..delayworld..")**"

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
        if Jastip then
            if WorldGaji:upper() == WorldSkrg then
                Muncul = true
            end
        end
        if Muncul then
            WorldSkrg = WorldSkrg:gsub(string.sub(WorldSkrg, 1, string.len(WorldSkrg) - 3), "")
        end
    end

    if hookURL == MainHook and (not HideWebhook or ShowMainInfo) then
        if HookID ~= "XXX" then
            URLWeb = hookURL.."/messages/"..HookID
            methodz = "Patch"
        else
            URLWeb = hookURL
            methodz = "Post"
        end
        local script = [[

        $w = "]]..URLWeb..[["

        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        $interface = Get-NetConnectionProfile
        $ip = Get-NetIPAddress -InterfaceAlias $interface.InterfaceAlias -AddressFamily IPv4 | ForEach-Object IPAddress
        $CompObject = Get-WmiObject -Class WIN32_OperatingSystem
        $Rams = ((($CompObject.TotalVisibleMemorySize - $CompObject.FreePhysicalMemory)*100)/ $CompObject.TotalVisibleMemorySize)
        $Ram = [Math]::Floor($Rams)
        $CPUs = (Get-WmiObject Win32_Processor | Measure-Object -Property LoadPercentage -Average | Select Average).Average
        $CPU = [Math]::Floor($CPUs)
        $LimitCPUz = ']].. LimitCPU ..[['
        $LihatIP = ']].. Lihatin ..[['

        if($CPU -le $LimitCPUz){
            $Mention = ']]..ingfo..[['
        }else{
            $Mention = 'Cek CPU Ngab <@]].. userdc ..[[> !'
        }

        if($LihatIP -match "Lihatin"){
            $YourIP = $ip
        }else{
            $YourIP = 'IP Disembunyikan'
        }

        [System.Collections.ArrayList]$embedArray = @()
        $descriptions = ']].. logger ..[[ ]]..TempOff..[[ ]]..AllDelay..[['
        $color       = ']]..Warna..[['


        $footerObject = [PSCustomObject]@{
            text = 'Rotation Farm by Ohdear#2320' + "`n" + ']]..TimezNow..[['
            icon_url = ']].. Thumbs ..[['
        }

        $thumbnailObject = [PSCustomObject]@{
            url = ']].. Thumbs ..[['
        }
        

        $authorObject = [PSCustomObject]@{
            name = "]]..Judulz..[[ || Author : Ohdear#2320"
            url = "https://discord.gg/TjVwdgma74"
            icon_url = "]]..LogoPartai[Lopar]..[["
        }

        $fieldArray = @(

            @{
                name = "]]..emot_bot..[[ Bot Name"
                value = "]]..OdBot().name..[[ **(]]..getPing()..[[ Ms)**"
                inline = "false"
            }

            @{
                name = ":earth_asia: Current World"
                value = "]]..WorldSkrg..[["
                inline = "true"
            }
            @{
                name = "]]..emot_pickaxe..[[ Tools"
                value = "]]..PickBotz..[["
                inline = "true"
            }
            @{
                name = "]]..emot_rank..[[ Bot Level"
                value = "]]..targetlv..[["
                inline = "true"
            }

            @{
                name = "]]..statzBot..[[ Bot Status"
                value = "**]]..(OdBot().status):upper()..[[**"
                inline = "true"
            }
            @{
                name = "]]..emot_tas..[[ Inventory Slot"
                value = "]]..(#getInventory() + 1)..[[/]]..OdBot().slots..[["
                inline = "true"
            }
            @{
                name = "]]..emot_gems..[[ Gems in Backpack"
                value = "]]..findItem(112)..[[/]]..hargapack..[["
                inline = "true"
            }

            @{
                name = "]]..emot_computer..[[ RDP Info"
                value = "$YourIP`nCPU USAGE $CPU%`nRAM USAGE $RAM%"
                inline = "true"
            }
            @{
                name = ":gem: ]]..GetNameID(FavItem)..[[ in Backpack"
                value = "]]..(findItem(FavItem))..[[ Items"
                inline = "true"
            }
            @{
                name = "]]..emot_gems..[[ All Gems and Timers"
                value = "]]..AllGems..[[ Gems`n]]..BotRun..[["
                inline = "true"
            }

            @{
                name = "]]..emot_world..[[ World Info"
                value = "]]..ShowWorld..[[]]..Winter..[["
                inline = "false"
            }
        )

        $embedObject = [PSCustomObject]@{
            description = $descriptions
            color       = $color
            footer      = $footerObject
            thumbnail   = $thumbnailObject
            author      = $authorObject
            fields      = $fieldArray
        }

        $embedArray.Add($embedObject) | Out-Null

        $Body = [PSCustomObject]@{

            embeds = $embedArray

            'username' = ']]..OdBot().name..[[|OD2320'
            'content' = $Mention

        }

        Invoke-RestMethod -Uri $w -Body ($Body | ConvertTo-Json -Depth 4) -Method ]]..methodz..[[ -ContentType 'application/json'
        ]]
        local pipe = io.popen("powershell -command -", "w")
        pipe:write(script)
        pipe:close()

    elseif hookURL == WebhookSeed and (not HideWebhook or ShowSeedInfo) then
        if HookIDSeed ~= "XXX" then
            URLWeb = hookURL.."/messages/"..HookIDSeed
            methodz = "Patch"
        else
            URLWeb = hookURL
            methodz = "Post"
        end
        local script = [[

        $w = "]]..URLWeb..[["

        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        $interface = Get-NetConnectionProfile
        $ip = Get-NetIPAddress -InterfaceAlias $interface.InterfaceAlias -AddressFamily IPv4 | ForEach-Object IPAddress
        $CompObject = Get-WmiObject -Class WIN32_OperatingSystem
        $Rams = ((($CompObject.TotalVisibleMemorySize - $CompObject.FreePhysicalMemory)*100)/ $CompObject.TotalVisibleMemorySize)
        $Ram = [Math]::Floor($Rams)
        $CPUs = (Get-WmiObject Win32_Processor | Measure-Object -Property LoadPercentage -Average | Select Average).Average
        $CPU = [Math]::Floor($CPUs)
        $LimitCPUz = ']].. LimitCPU ..[['
        $LihatIP = ']].. Lihatin ..[['

        if($CPU -le $LimitCPUz){
            $Mention = ']]..ingfo..[['
        }else{
            $Mention = 'Cek CPU Ngab <@]].. userdc ..[[> !'
        }

        if($LihatIP -match "Lihatin"){
            $YourIP = $ip
        }else{
            $YourIP = 'IP Disembunyikan'
        }

        [System.Collections.ArrayList]$embedArray = @()
        $descriptions = ']].. logger ..[['
        $color       = ']]..Warna..[['


        $footerObject = [PSCustomObject]@{
            text = 'Rotation Farm by Ohdear#2320' + "`n" + ']]..TimezNow..[['
            icon_url = ']].. Thumbs ..[['
        }

        $thumbnailObject = [PSCustomObject]@{
            url = ']].. Thumbs ..[['
        }

        $authorObject = [PSCustomObject]@{
            name = "]]..Judulz..[[ || Author : Ohdear#2320 "
            url = "https://discord.gg/TjVwdgma74"
            icon_url = "]]..LogoPartai[Lopar]..[["
        }

        $fieldArray = @(
            @{
                name = "]]..emot_bot..[[ Bot Name"
                value = "]]..OdBot().name..[["
                inline = "false"
            }
            @{
                name = "]]..emot_world..[[ ]]..GetNameID(seed)..[["
                value = "]]..ShowSeed..[["
                inline = "true"
            }
            @{
                name = "]]..emot_tas..[[ Backpack (Seed)"
                value = "]]..findItem(seed)..[[ ]]..GetNameID(seed)..[["
                inline = "true"
            }
        )

        $embedObject = [PSCustomObject]@{
            description = $descriptions
            color       = $color
            footer      = $footerObject
            thumbnail   = $thumbnailObject
            author      = $authorObject
            fields      = $fieldArray
        }

        $embedArray.Add($embedObject) | Out-Null

        $Body = [PSCustomObject]@{

            embeds = $embedArray

            'username' = ']]..OdBot().name..[[|OD2320'
            'content' = $Mention

        }

        Invoke-RestMethod -Uri $w -Body ($Body | ConvertTo-Json -Depth 4) -Method ]]..methodz..[[ -ContentType 'application/json'
        ]]
        local pipe = io.popen("powershell -command -", "w")
        pipe:write(script)
        pipe:close()

    elseif hookURL == WebhookPack and (not HideWebhook or ShowPackInfo) then
        if HookIDPack ~= "XXX" then
            URLWeb = hookURL.."/messages/"..HookIDPack
            methodz = "Patch"
        else
            URLWeb = hookURL
            methodz = "Post"
        end
        local script = [[

        $w = "]]..URLWeb..[["

        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        $interface = Get-NetConnectionProfile
        $ip = Get-NetIPAddress -InterfaceAlias $interface.InterfaceAlias -AddressFamily IPv4 | ForEach-Object IPAddress
        $CompObject = Get-WmiObject -Class WIN32_OperatingSystem
        $Rams = ((($CompObject.TotalVisibleMemorySize - $CompObject.FreePhysicalMemory)*100)/ $CompObject.TotalVisibleMemorySize)
        $Ram = [Math]::Floor($Rams)
        $CPUs = (Get-WmiObject Win32_Processor | Measure-Object -Property LoadPercentage -Average | Select Average).Average
        $CPU = [Math]::Floor($CPUs)
        $LimitCPUz = ']].. LimitCPU ..[['
        $LihatIP = ']].. Lihatin ..[['

        if($CPU -le $LimitCPUz){
            $Mention = ']]..ingfo..[['
        }else{
            $Mention = 'Cek CPU Ngab <@]].. userdc ..[[> !'
        }

        if($LihatIP -match "Lihatin"){
            $YourIP = $ip
        }else{
            $YourIP = 'IP Disembunyikan'
        }

        [System.Collections.ArrayList]$embedArray = @()
        $descriptions = ']].. logger ..[['
        $color       = ']]..Warna..[['


        $footerObject = [PSCustomObject]@{
            text = 'Rotation Farm by Ohdear#2320' + "`n" + ']]..TimezNow..[['
            icon_url = ']].. Thumbs ..[['
        }

        $thumbnailObject = [PSCustomObject]@{
            url = ']].. Thumbs ..[['
        }

        $authorObject = [PSCustomObject]@{
            name = "]]..Judulz..[[ || Author : Ohdear#2320 "
            url = "https://discord.gg/TjVwdgma74"
            icon_url = "]]..LogoPartai[Lopar]..[["
        }

        $fieldArray = @(
            @{
                name = "]]..emot_bot..[[ Bot Name"
                value = "]]..OdBot().name..[["
                inline = "false"
            }
            @{
                name = "]]..emot_pack..[[ ]]..namapack:upper()..[["
                value = "]]..ShowPack..[["
                inline = "true"
            }
            @{
                name = ":beginner: Other Information"
                value = "All Gems : ]]..SemuaGems()..[[`nOnline/Offline : (]]..StatusAktif("online")..[[/]]..StatusAktif("offline")..[[)"
                inline = "false"
            }
        )

        $embedObject = [PSCustomObject]@{
            description = $descriptions
            color       = $color
            footer      = $footerObject
            thumbnail   = $thumbnailObject
            author      = $authorObject
            fields      = $fieldArray
        }

        $embedArray.Add($embedObject) | Out-Null

        $Body = [PSCustomObject]@{

            embeds = $embedArray

            'username' = ']]..OdBot().name..[[|OD2320'
            'content' = $Mention

        }

        Invoke-RestMethod -Uri $w -Body ($Body | ConvertTo-Json -Depth 4) -Method ]]..methodz..[[ -ContentType 'application/json'
        ]]
        local pipe = io.popen("powershell -command -", "w")
        pipe:write(script)
        pipe:close()
    end
end
