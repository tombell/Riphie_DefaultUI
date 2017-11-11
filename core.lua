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

local function FrameColors()
	for i,v in pairs({
		-- select(1, BurningEmbersBarFrame:GetRegions()),
		-- select(1, BurningEmbersBarFrameEmber1:GetRegions()),
		-- select(1, BurningEmbersBarFrameEmber2:GetRegions()),
		-- select(1, BurningEmbersBarFrameEmber3:GetRegions()),
		-- select(1, BurningEmbersBarFrameEmber4:GetRegions()),
		-- select(5, ShardBarFrameShard1:GetRegions()),
		-- select(5, ShardBarFrameShard2:GetRegions()),
		-- select(5, ShardBarFrameShard3:GetRegions()),
		-- select(5, ShardBarFrameShard4:GetRegions()),
		ArenaEnemyFrame1PetFrameTexture,
		ArenaEnemyFrame1SpecBorder,
		ArenaEnemyFrame1Texture,
		ArenaEnemyFrame2PetFrameTexture,
		ArenaEnemyFrame2SpecBorder,
		ArenaEnemyFrame2Texture,
		ArenaEnemyFrame3PetFrameTexture,
		ArenaEnemyFrame3SpecBorder,
		ArenaEnemyFrame3Texture, 
		ArenaEnemyFrame4PetFrameTexture, 
		ArenaEnemyFrame4SpecBorder,
		ArenaEnemyFrame4Texture,
		ArenaEnemyFrame5PetFrameTexture,
		ArenaEnemyFrame5SpecBorder,
		ArenaEnemyFrame5Texture,
		ArenaPrepFrame1SpecBorder,
		ArenaPrepFrame1Texture,
		ArenaPrepFrame2SpecBorder,
		ArenaPrepFrame2Texture,
		ArenaPrepFrame3SpecBorder,
		ArenaPrepFrame3Texture,
		ArenaPrepFrame4SpecBorder,
		ArenaPrepFrame4Texture,
		ArenaPrepFrame5SpecBorder,
		ArenaPrepFrame5Texture,
		Boss1TargetFrameSpellBarBorder,
		Boss1TargetFrameTextureFrameTexture,
		Boss2TargetFrameSpellBarBorder,
		Boss2TargetFrameTextureFrameTexture,
		Boss3TargetFrameSpellBarBorder,
		Boss3TargetFrameTextureFrameTexture,
		Boss4TargetFrameSpellBarBorder,
		Boss4TargetFrameTextureFrameTexture,
		Boss5TargetFrameSpellBarBorder,
		Boss5TargetFrameTextureFrameTexture,
		CastingBarFrameBorder,
		CharacterFrameBg,
		CharacterFrameTitleBg,
		CompactRaidFrameManagerBg,
		FocusFrameSpellBarBorder,
		FocusFrameTextureFrameTexture,
		FocusFrameToTTextureFrameTexture,
		MainMenuBarLeftEndCap,
		MainMenuBarRightEndCap, 
		MainMenuBarTexture0,
		MainMenuBarTexture1,
		MainMenuBarTexture2,
		MainMenuBarTexture3,
		MainMenuMaxLevelBar0,
		MainMenuMaxLevelBar1,
		MainMenuMaxLevelBar2,
		MainMenuMaxLevelBar3,
		MainMenuXPBarTextureLeftCap,
		MainMenuXPBarTextureMid,
		MainMenuXPBarTextureRightCap,
		MiniMapTrackingButtonBorder,
		MinimapBorder,
		MinimapBorderTop,
		ObjectiveTrackerBlocksFrame.QuestHeader.Background,
		PaladinPowerBarBG,
		PaladinPowerBarBankBG,
		PartyMemberFrame1PetFrameTexture,
		PartyMemberFrame1Texture,
		PartyMemberFrame2PetFrameTexture,
		PartyMemberFrame2Texture,
		PartyMemberFrame3PetFrameTexture,
		PartyMemberFrame3Texture,
		PartyMemberFrame4PetFrameTexture,
		PartyMemberFrame4Texture,
		PetFrameTexture,
		PlayerFrameTexture,
		ReputationWatchBarTexture0,
		ReputationWatchBarTexture1,
		ReputationWatchBarTexture2,
		ReputationWatchBarTexture3,
		ReputationXPBarTexture0,
		ReputationXPBarTexture1,
		ReputationXPBarTexture2,
		ReputationXPBarTexture3,
		RuneButtonIndividual1BorderTexture,
		RuneButtonIndividual2BorderTexture,
		RuneButtonIndividual3BorderTexture,
		RuneButtonIndividual4BorderTexture,
		RuneButtonIndividual5BorderTexture,
		RuneButtonIndividual6BorderTexture,
		SlidingActionBarTexture0,
		SlidingActionBarTexture1,
		StanceBarLeft,
		StanceBarMiddle,
		StanceBarRight,
		TargetFrameSpellBarBorder,
		TargetFrameTextureFrameTexture,
		TargetFrameToTTextureFrameTexture,
  }) do
    v:SetVertexColor(.5, .5, .5, 1);
  end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("GROUP_ROSTER_UPDATE")
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
frame:RegisterEvent("PLAYER_FOCUS_CHANGED")
frame:RegisterEvent("UNIT_FACTION")
frame:RegisterEvent("PLAYER_LOGIN");
frame:RegisterEvent("ADDON_LOADED");
frame:SetScript("OnEvent", function(self, event, ...)
  if event == "ADDON_LOADED" then
    FrameColors()
    return
  end

  if UnitIsPlayer("target") then
    local c = RAID_CLASS_COLORS[select(2, UnitClass("target"))]
    TargetFrameNameBackground:SetVertexColor(c.r, c.g, c.b)
  end

  if UnitIsPlayer("focus") then
    local c = RAID_CLASS_COLORS[select(2, UnitClass("focus"))]
    FocusFrameNameBackground:SetVertexColor(c.r, c.g, c.b)
  end
end)

