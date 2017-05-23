load *pdb
/cmd.load('/Users/bonet/SandBox/FoldFromLoopsTutorial/presentation/resources/onesegment_rmsd/1ddv_nub_10_0006.pdb', quiet=0)
/cmd.load('/Users/bonet/SandBox/FoldFromLoopsTutorial/presentation/resources/onesegment_rmsd/1ddv_nub_28_0001.pdb', quiet=0)
/cmd.load('/Users/bonet/SandBox/FoldFromLoopsTutorial/presentation/resources/onesegment_rmsd/template.pdb', quiet=0)
util.mass_align("template",0,_self=cmd)
cmd.hide("everything","all")
cmd.delete("aln_all_to_template")
cmd.disable('1ddv_nub_28_0001')
cmd.disable('1ddv_nub_10_0006')
cmd.show("cartoon"   ,"template")
util.color_deep("palegreen", 'template')
sele template_region, template and i. 25-61
sele template_region, template and i. 35-61
util.color_deep("green", 'template_region')
cmd.disable('template_region')
select nub10_region, 1ddv_nub_10_0006 and i. 35-61
select nub28_region, 1ddv_nub_28_0001 and i. 35-61
cmd.disable('nub28_region')
cmd.enable('1ddv_nub_28_0001',1)
cmd.show("cartoon"   ,"1ddv_nub_28_0001")
util.color_deep("lightblue", '1ddv_nub_28_0001')
cmd.enable('nub28_region')
util.color_deep("blue", 'nub28_region')
cmd.disable('nub28_region')
cmd.enable('1ddv_nub_10_0006',1)
cmd.show("cartoon"   ,"1ddv_nub_10_0006")
util.color_deep("salmon", '1ddv_nub_10_0006')
util.color_deep("red", 'nub10_region')
cmd.disable('1ddv_nub_28_0001')
cmd.enable('1ddv_nub_28_0001',1)
cmd.disable('1ddv_nub_28_0001')
cmd.disable('template')
cmd.enable('1ddv_nub_28_0001',1)
cmd.enable('template',1)
cmd.disable('1ddv_nub_28_0001')
cmd.disable('1ddv_nub_10_0006')
cmd.select('sele','none')
cmd.select('sele',"byresi((((sele) or byresi((template`353))) and not ((byresi((template`353))) and byresi(sele))))",enable=1)
cmd.select('sele',"byresi((((sele) or byresi((template`313))) and not ((byresi((template`313))) and byresi(sele))))",enable=1)
cmd.select('sele',"byresi((((sele) or byresi((template`182))) and not ((byresi((template`182))) and byresi(sele))))",enable=1)
cmd.select('sele',"byresi((((sele) or byresi((template`43))) and not ((byresi((template`43))) and byresi(sele))))",enable=1)
cmd.select('sele',"byresi((((sele) or byresi((template`1125))) and not ((byresi((template`1125))) and byresi(sele))))",enable=1)
cmd.select('sele',"byresi((((sele) or byresi((template`1211))) and not ((byresi((template`1211))) and byresi(sele))))",enable=1)
cmd.select('sele',"byresi((((sele) or byresi((template`1251))) and not ((byresi((template`1251))) and byresi(sele))))",enable=1)
cmd.select('sele',"byresi((((sele) or byresi((template`1330))) and not ((byresi((template`1330))) and byresi(sele))))",enable=1)
cmd.set('seq_view',1)
sele betas, i. 3-11 or i. 19-21 or i. 72-77 or i. 80-85
alter betas, ss="E"
rebuild
cmd.disable('betas')
alter betas, ss="B"
rebuild
alter betas, ss="S"
rebuild
cmd.enable('1ddv_nub_28_0001',1)
cmd.enable('1ddv_nub_10_0006',1)
cartoon automatic
set cartoon_loop_radius, 0.3
set cartoon_side_chain_helper, 1
set cartoon_discrete_colors, 1
bg_color white
set ray_opaque_background, off
set ray_texture, 5
set ray_shadows, 0
set antialias, 2
set ray_trace_mode, 1
set max_threads, 4
set specular, 0
set hash_max, 600
cmd.set('seq_view',0)
ray
png template_alignment.png, dpi=300
scene template_alignment, store
util.mass_align("template_region",0,_self=cmd)
ray
png motif_alignment.png, dpi=300
scene motif_alignment, store
cmd.scene('''template_alignment''')
cmd.scene('''motif_alignment''')
cmd.scene('''template_alignment''')
cmd.scene('''motif_alignment''')
cmd.scene('''template_alignment''')
save /Users/bonet/SandBox/FoldFromLoopsTutorial/presentation/resources/onesegment_rmsd/onesegment.pse,format=pse
cmd.save('''/Users/bonet/SandBox/FoldFromLoopsTutorial/presentation/resources/onesegment_rmsd/onesegment.pse''','','pse',quiet=0)
cmd.set('session_changed',0)
