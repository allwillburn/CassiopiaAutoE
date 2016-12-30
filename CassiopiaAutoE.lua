if GetObjectName(GetMyHero()) ~= "Cassiopeia" then return end

local CassiopeiaMenu = Menu("Cassiopeia", "Cassiopeia")

CassiopeiaMenu:SubMenu("Farm", "Farm")
CassiopeiaMenu.Farm:Boolean("E", "AutoE", true)

OnTick(function (myHero)
  
local BonusAP = GetBonusAbilityPower(myHero)
local BaseAP = GetBaseAbilityPower(myHero)
local EDmg = 52 * GetCastLevel(myHero, _E) + (BaseAP + BonusAP) * 1.1
local ERange = 700

 
BonusAP = GetBonusAbilityPower(myHero)
BaseAP = GetBaseAbilityPower(myHero)
EDmg = 52 * GetCastLevel(myHero, _E) + (BaseAP + BonusAP) * 1.1

--Auto E on minions
    for _, minion in pairs(minionManager.objects) do
        if CassiopeiaMenu.Farm.E:Value() and Ready(_E) and ValidTarget(minion, ERange) and GetCurrentHP(minion) < CalcDamage(myHero,minion,EDmg,0) then
            CastTargetSpell(minion,_E)
        end
    end
end)
