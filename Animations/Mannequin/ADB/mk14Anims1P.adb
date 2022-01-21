<AnimDB FragDef="Animations/Mannequin/ADB/PlayerActions.xml" TagDef="Animations/Mannequin/ADB/PlayerTags.xml">
  <FragmentList>
    <fire>
      <Fragment BlendOutDuration="0.2" Tags="mk14+silencer">
        <AnimLayer>
          <Blend ExitTime="0" StartTime="0" Duration="0" />
          <Animation name="stand_fire_m16" flags="Sample30Hz" weight="0.5" />
        </AnimLayer>
      </Fragment>
      <Fragment BlendOutDuration="0.2" Tags="mk14">
        <AnimLayer>
          <Blend ExitTime="0" StartTime="0" Duration="0" />
          <Animation name="stand_fire_m16" flags="Sample30Hz" weight="0.5" />
        </AnimLayer>
      </Fragment>
    </fire>
    <empty_clip>
      <Fragment BlendOutDuration="0.2" Tags="mk14">
        <AnimLayer>
          <Blend ExitTime="0" StartTime="0" Duration="0.2" />
          <Animation name="dryfire_pistols_generic" />
        </AnimLayer>
      </Fragment>
    </empty_clip>
    <idlePose>
      <Fragment BlendOutDuration="0.2" Tags="mk14+crouch+optic">
        <AnimLayer>
          <Blend ExitTime="0" StartTime="0" Duration="0" />
          <Animation name="crouch_idlepose_optic_m16" flags="Loop" />
        </AnimLayer>
      </Fragment>
      <Fragment BlendOutDuration="0.2" Tags="mk14+prone+optic">
        <AnimLayer>
          <Blend ExitTime="0" StartTime="0" Duration="0" />
          <Animation name="prone_idlepose_optic_m16" flags="Loop" />
        </AnimLayer>
      </Fragment>
      <Fragment BlendOutDuration="0.2" Tags="mk14+crouch">
        <AnimLayer>
          <Blend ExitTime="0" StartTime="0" Duration="0" />
          <Animation name="crouch_idlepose_tactical_m16" flags="Loop" />
        </AnimLayer>
      </Fragment>
      <Fragment BlendOutDuration="0.2" Tags="mk14+prone">
        <AnimLayer>
          <Blend ExitTime="0" StartTime="0" Duration="0" />
          <Animation name="prone_idlepose_tactical_m16" flags="Loop" />
        </AnimLayer>
      </Fragment>
      <Fragment BlendOutDuration="0.2" Tags="mk14+optic">
        <AnimLayer>
          <Blend ExitTime="0" StartTime="0" Duration="0" />
          <Animation name="stand_idlepose_optic_m16" flags="Loop" />
        </AnimLayer>
      </Fragment>
      <Fragment BlendOutDuration="0.2" Tags="mk14">
        <AnimLayer>
          <Blend ExitTime="0" StartTime="0" Duration="0" />
          <Animation name="stand_idlepose_tactical_m16" flags="Loop" />
        </AnimLayer>
      </Fragment>
    </idlePose>
    <FPMovement>
      <Fragment BlendOutDuration="0.2" Tags="mk14">
        <AnimLayer>
          <Blend ExitTime="0" StartTime="0" Duration="0.2" />
          <Animation name="stand_run_iron_additive_rifle" flags="Loop" speed="0.5" weight="0.5" />
        </AnimLayer>
      </Fragment>
    </FPMovement>
    <lean>
      <Fragment BlendOutDuration="0.2" Tags="mk14+optic+leftLean">
        <AnimLayer>
          <Blend ExitTime="0" StartTime="0" Duration="0" />
          <Animation name="stand_left_lean_fp_optic_m16" flags="Loop" />
        </AnimLayer>
      </Fragment>
      <Fragment BlendOutDuration="0.2" Tags="mk14+optic+rightLean">
        <AnimLayer>
          <Blend ExitTime="0" StartTime="0" Duration="0" />
          <Animation name="stand_right_lean_fp_optic_m16" flags="Loop" />
        </AnimLayer>
      </Fragment>
    </lean>
  </FragmentList>
</AnimDB>