# multi-te
Retrospective gating, reconstruction, and mapping of pulmonary multi-TE UTE MRI.

## Functionality
There are multiple parts to this project. Each is designed to operate independently of the others. However, each function set requires one or more input files which may or may not be generated by a different function set (e.g. reconstruction requires the gated FIDs from the retro-gating routine).

The ultimate goal is for this project to be able to use data acquired using a variable number of TEs and produce output accordingly (i.e. gate, reconstruct, map data collected with one or multiple TEs).

### Retrospective-Gating
Examines the first and second derivatives of the leading phase of the FID information (for each TE) and bins the data according to the points corresponding to end expiration and end inspiration. This is done to minimize image artifacts due to respiratory motion of the subject being imaged.

### Image Reconstruction
Performs reconstrcution of MR images from gated k-space information. **Note:** this routine uses `MEX` files to interface with `C` files that perform gridding of k-space data to a Cartesian system.

### T2* Mapping
* Currently calculates T2* as an average of the TEs.
* Involves creating binary masks of the lungs prior to masking.
* Highlights T2* differences between lung parenchyma, vasculature, and fibrotic tissue.

---

### YAML-Matlab
This project uses an input file written in [YAML](http://yaml.org/) to simplify execution and reduce hard-coding. The YAML file is read using [YAMLMatlab](https://code.google.com/archive/p/yamlmatlab/)
