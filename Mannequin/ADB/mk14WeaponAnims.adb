<AnimDB FragDef="Animations/Mannequin/ADB/PlayerActions.xml" TagDef="Animations/Mannequin/ADB/PlayerTags.xml">
  <FragmentList>
    <select>
      <Fragment BlendOutDuration="0.2" Tags="mk14+tactical" FragTags="first">
        <AnimLayer>
          <Blend ExitTime="0" StartTime="0" Duration="0.2" />
          <Animation name="weapon_first_select_m16" />
        </AnimLayer>
      </Fragment>
    </select>
    <fire>
      <Fragment BlendOutDuration="0.2" Tags="mk14">
        <AnimLayer>
          <Blend ExitTime="0" StartTime="0" Duration="0.2" />
          <Animation name="weapon_fire_m16" />
        </AnimLayer>
      </Fragment>
    </fire>
    <reload>
      <Fragment BlendOutDuration="0.2" Tags="mk14+stanagx30+tactical+outOfAmmo">
        <ProcLayer>
          <Blend ExitTime="0.29999995" StartTime="0" Duration="0" />
          <Procedural type="HideAttachment">
            <ProceduralParams>
              <AttachmentName value="mag_stanag" />
            </ProceduralParams>
          </Procedural>
          <Blend ExitTime="3.3" StartTime="0" Duration="0" />
          <Procedural type="" />
        </ProcLayer>
      </Fragment>
      <Fragment BlendOutDuration="0.2" Tags="mk14+stanagx30+tactical">
        <ProcLayer>
          <Blend ExitTime="0.29999995" StartTime="0" Duration="0" />
          <Procedural type="HideAttachment">
            <ProceduralParams>
              <AttachmentName value="mag_stanag" />
            </ProceduralParams>
          </Procedural>
          <Blend ExitTime="3.3" StartTime="0" Duration="0" />
          <Procedural type="" />
        </ProcLayer>
      </Fragment>
      <Fragment BlendOutDuration="0.2" Tags="mk14+tactical">
        <ProcLayer>
          <Blend ExitTime="0" StartTime="0" Duration="0" />
          <Procedural type="HideAttachment">
            <ProceduralParams>
              <AttachmentName value="mag_stanag" />
            </ProceduralParams>
          </Procedural>
          <Blend ExitTime="1.8" StartTime="0" Duration="0" />
          <Procedural type="" />
          <Blend ExitTime="1.8" StartTime="0" Duration="0" />
          <Procedural type="" />
        </ProcLayer>
      </Fragment>
    </reload>
  </FragmentList>
</AnimDB>