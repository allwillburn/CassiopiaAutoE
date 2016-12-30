if GetObjectName(GetMyHero()) ~= "Cassiopia" then return end

local CassiopiaMenu = Menu("Cassiopia", "Cassiopia")

CassiopiaMenu:SubMenu("Farm", "Farm")
CassiopiaMenu.Farm:Boolean("E", "AutoE", true)

OnTick(function (myHero)
  
local BonusAD = GetBonusDmg(myHero)
local BaseAD = GetBaseDamage(myHero)
local EDmg = 52 * GetCastLevel(myHero, _E) + (BaseAP + BonusAP) * 1.1
local ERange = 700

 
BonusAD = GetBonusDmg(myHero)
BaseAD = GetBaseDamage(myHero)
EDmg = 52 * GetCastLevel(myHero, _E) + (BaseAP + BonusAP) * 1.1

--Auto E on minions
    for _, minion in pairs(minionManager.objects) do
        if CassiopiaMenu.Farm.E:Value() and Ready(_E) and ValidTarget(minion, ERange) and GetCurrentHP(minion) < CalcDamage(myHero,minion,EDmg,0) then
            CastTargetSpell(minion,_E)
        end
    end
end)
