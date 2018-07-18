local A, L = ...
local cfg = L.cfg

LoadAddOn("Blizzard_TalkingHeadUI")

local THF = TalkingHeadFrame
THF:SetMovable(true)
THF:SetClampedToScreen(true)
THF.ignoreFramePositionManager = true
THF:ClearAllPoints()
THF:SetPoint(
  cfg.talkinghead.pos.a1,
  cfg.talkinghead.pos.af,
  cfg.talkinghead.pos.a2,
  cfg.talkinghead.pos.x,
  cfg.talkinghead.pos.y
)
THF:SetScale(cfg.talkinghead.scale)

for i, alertSubSystem in pairs(AlertFrame.alertFrameSubSystems) do
  if alertSubSystem.anchorFrame == THF then
    tremove(AlertFrame.alertFrameSubSystems, i)
  end
end

MainMenuBar:SetScale(cfg.actionbars.scale)
MainMenuBar.SetScale = function() end

PlayerFrame:SetUserPlaced(true)
PlayerFrame:SetDontSavePosition(true)
PlayerFrame:ClearAllPoints()
PlayerFrame:SetPoint(
  cfg.unitframes.player.a1,
  cfg.unitframes.player.af,
  cfg.unitframes.player.a2,
  cfg.unitframes.player.x,
  cfg.unitframes.player.y
)
PlayerFrame.SetPoint = function() end
PlayerFrame:SetScale(cfg.unitframes.player.scale)

PlayerHitIndicator:SetText(nil)
PlayerHitIndicator.SetText = function() end

PlayerFrameGroupIndicator.Show = function() end

TargetFrame:SetUserPlaced(true)
TargetFrame:SetDontSavePosition(true)
TargetFrame:ClearAllPoints()
TargetFrame:SetPoint(
  cfg.unitframes.target.a1,
  cfg.unitframes.target.af,
  cfg.unitframes.target.a2,
  cfg.unitframes.target.x,
  cfg.unitframes.target.y
)
TargetFrame.SetPoint = function() end
TargetFrame:SetScale(cfg.unitframes.target.scale)

PetHitIndicator:SetText(nil)
PetHitIndicator.SetText = function() end

CastingBarFrame:ClearAllPoints()
CastingBarFrame:SetPoint(
  cfg.castingbar.pos.a1,
  cfg.castingbar.pos.af,
  cfg.castingbar.pos.a2,
  cfg.castingbar.pos.x,
  cfg.castingbar.pos.y
)
CastingBarFrame.SetPoint = function() end

CompactUnitFrameProfilesGeneralOptionsFrameHeightSlider:SetMinMaxValues(10, 150)
CompactUnitFrameProfilesGeneralOptionsFrameWidthSlider:SetMinMaxValues(10, 150)

local frame = CreateFrame("Frame")
frame:RegisterEvent("GROUP_ROSTER_UPDATE")
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
frame:RegisterEvent("PLAYER_FOCUS_CHANGED")
frame:RegisterEvent("UNIT_FACTION")
frame:RegisterEvent("PLAYER_LOGIN");
frame:RegisterEvent("ADDON_LOADED");
frame:SetScript("OnEvent", function(self, event, ...)
  if UnitIsPlayer("target") then
    local c = RAID_CLASS_COLORS[select(2, UnitClass("target"))]
    TargetFrameNameBackground:SetVertexColor(c.r, c.g, c.b)
  end

  if UnitIsPlayer("focus") then
    local c = RAID_CLASS_COLORS[select(2, UnitClass("focus"))]
    FocusFrameNameBackground:SetVertexColor(c.r, c.g, c.b)
  end
end)
