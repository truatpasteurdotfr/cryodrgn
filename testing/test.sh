python ../backproject.py data/toy_projections.mrcs data/toy_angles.pkl -o output/toy_recon.mrc
chimera output/toy_recon.mrc data/toymodel_small_nocenter.mrc 
python ../backproject_nn.py data/toy_projections.mrcs data/toy_angles.pkl -o output/toy_nn_recon -n 10
python ../backproject_hartley.py data/toy_projections.mrcs data/toy_angles.pkl -o output/toy_recon_hartley.mrc
python ../vae_rot.py  data/toy_projections.mrcs -o output/toy_recon_vae --lr .0001 
python ../vae_rot.py  data/aic_projections_small.mrc -o output/aic_projections --lr .0001 -n 10

python ../bnb_rot.py data/toy_projections.mrcs -o output/toy_recon_bnb
