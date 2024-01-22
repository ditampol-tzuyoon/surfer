Odirrrr = "https://raw.githubusercontent.com/ditampol-tzuyoon/surfer/main/Image%20Animasi.gif"

LogoPartai = {
    "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/Erine/1.jpg",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/Erine/2.jpg",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/Erine/3.jpg",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/Erine/4.jpg",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/Erine/5.jpg",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/Erine/6.jpg",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/Erine/7.jpg",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/Erine/8.jpg",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/Erine/9.jpg",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/Erine/10.jpg",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/Erine/11.jpg",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/Erine/12.jpg",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/Erine/13.jpg"
}

function IniWaktu()
    -- Mendapatkan waktu saat ini dalam detik sejak epoch dalam UTC
    local currentTimeUTC = os.time(os.date("!*t"))
    local FormatUTC = currentTimeUTC + (UTC_Time * 60 * 60)

    -- Mendapatkan informasi waktu dalam tabel
    local timeTable = os.date("*t", FormatUTC)
    
    -- Daftar singkatan hari dan bulan
    local dayAbbrev = {"Min", "Sen", "Sel", "Rab", "Kam", "Jum", "Sab"}
    local monthAbbrev = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"}
    
    -- Membuat format waktu yang diinginkan
    local formattedTime = string.format("%s, %02d %s %d | %02d:%02d:%02d | UTC+"..UTC_Time, 
        dayAbbrev[timeTable.wday], 
        timeTable.day,
        monthAbbrev[timeTable.month],  -- Menggunakan monthAbbrev untuk mendapatkan singkatan bulan
        timeTable.year,
        timeTable.hour, 
        timeTable.min, 
        timeTable.sec
    )
    
    return formattedTime
end

function AmbilWaktu()
    -- Mengatur zona waktu menjadi UTC+7 (waktu Jakarta)
    local currentTimeUTC = os.time(os.date("!*t"))
    local FormatUTC = currentTimeUTC + (UTC_Time * 60 * 60)

    -- Mendapatkan informasi waktu dalam tabel
    local timeTable = os.date("*t", FormatUTC)

    local formattedTime = string.format("%02d:%02d:%02d (UTC+"..UTC_Time..")", 
        timeTable.hour, 
        timeTable.min, 
        timeTable.sec
    )
    
    return formattedTime
end

function Tegs(abc)
    log(AmbilWaktu().." | "..OdBot().name.." | "..abc)
end

function ohderin(logger)
	math.randomseed(os.time() + os.clock() * 1000)

    Lopar = LogoPartai[math.random(1, #LogoPartai)]

    local RequestINFO = {}
    RequestINFO.url = PingHook
    RequestINFO.json = true
    RequestINFO.method=POST
    RequestINFO.postData = [[
        {
            "embeds": [{
                "description": "]].. logger ..[[",
                "color": "]] .. math.random(0, 16777215) .. [[",

                "image": {
                    "url": "]].. Odirrrr ..[["
                },

                "author": {
                    "name": "Auto Build World | Ohdear_",
                    "url": "https://discord.gg/TjVwdgma74",
                    "icon_url": "https://static.wikia.nocookie.net/growtopia/images/8/8f/ItemSprites.png/revision/latest/window-crop/width/32/x-offset/1376/y-offset/800/window-width/32/window-height/32?format=original&fill=cb-20240102132414"
                },
 
                "footer": {
                    "text": "Dirt Farm by Ohdear_ \n]]..IniWaktu()..[["
                },

                "thumbnail": {
                    "url": "]].. Lopar ..[["
                }
            }]
        }
    ]]
    httpReq(RequestINFO)
end
