ListPembeli = {
    "E078-BA66-0CC4-C155-12A0-0524"
}

function CekBuyer()
    for i, v in pairs(ListPembeli) do
        if hwid() == v then
            return true
        end
    end
    return false
end
