Config = {}

Config.GrapeItem = 'uzum'
Config.WineItem = 'sarap'
Config.BlackMoneyItem = 'blackmoney'
Config.SellPrice = 30
Config.Job = 'mechanic'

Config.Texts = {
    GrapePick = "[E] Uzum Topla",
    GrapePickProg = "Üzüm toplanıyor..",
    GrapeGrind = "[E] Sarap isle",
    GrapeGrindProg = "Şarap işleniyor..",
    GrapeSell = "[E] Sarap sat"
}

Config.Locations = {
    grapeField = vector4(1917.78, 4808.54, 44.55, 129.27),
    processingSpot = vector4(2016.51, 4987.52, 42.1, 308.44),
    sellingSpot = vector4(1537.93, 1709.71, 109.79, 249.72)
}

Config.Blips = {
    CollectionBlip = {
        Enable = true,
        Sprite = 569,
        Display = 4,
        Scale = 0.8,
        Colour = 2,
        Name = "Üzüm Tarlası"
    },
    ProcessingBlip = {
        Enable = true,
        Sprite = 85,
        Display = 4,
        Scale = 0.8,
        Colour = 3,
        Name = "Şarap İşleme"
    },
    SellingBlip = {
        Enable = true,
        Sprite = 478,
        Display = 4,
        Scale = 0.8,
        Colour = 1,
        Name = "Şarap Satış"
    }
}

Config.Notifications = {
    HarvestSuccess = "10 üzüm hasat ettiniz!",
    HarvestFail = "Envanterinizde yeterli yer yok!",
    ProcessSuccess = "10 üzümü işleyerek 1 şarap elde ettiniz!",
    ProcessFail = "Yeterli üzümünüz yok!",
    SellSuccess1 = "Şarabı satarak ",
    SellSuccess2 = " kirli para kazandınız!",
    SellFailNoWine = "Yeterli şarabınız yok!",
    SellFailJob = "Bu işi yapmak için gerekli mesleğe sahip değilsiniz!"
}