# ClamAV Docker Image

This repository contains a modified Docker image for ClamAV. The image is almost identical to the central ClamAV Docker image, but includes a wrapper init that reconfigures it. Our main goal with these modifications is to allow users the flexibility of either using a private mirror or continuing with the central mirror.

## Usage

### Docker Compose
Use the following Docker Compose configuration to get the modified ClamAV image up and running:# ClamAV Docker Image

This repository contains a modified Docker image for ClamAV. The image is almost identical to the central ClamAV Docker image, but includes a wrapper init that reconfigures it. Our main goal with these modifications is to allow users the flexibility of either using a private mirror or continuing with the central mirror.

## Usage

### Docker Compose
Use the following Docker Compose configuration to get the modified ClamAV image up and running:

```yaml
version: '3.6'
services:
  laa-clamav:
    build:
      context: .
    expose:
      - "3310"
    volumes:
      - ./data:/var/lib/clamav
    environment:
      - FRESHCLAM_CHECKS=24 
      - MIRROR_URL=https:/mirror.com 
```

In this configuration, `FRESHCLAM_CHECKS` indicates how many times ClamAV should check for updates each day, while `MIRROR_URL` should be set to your private mirror URL.
It is important to not neither is a mandatory parameter and if you dont providee them you will essentially be using the base image


### Docker Run
Alternatively, you can use Docker Run to start the container:

```bash
docker run -d -p 3310:3310 -v ./data:/var/lib/clamav -e FRESHCLAM_CHECKS=24 -e MIRROR_URL=https://mirror.com laa-clamav
```

Be sure to replace `https://mirror.com` with your actual private mirror URL fround in the cloud platform namespace laa-clamav-mirror-production.


## Pipeline

This Docker image is built on top of the latest stable ClamAV image:

```dockerfile
FROM clamav/clamav-debian:stable
```

Since the stable release of ClamAV changes regularly, we have a pipeline that builds a new Docker image daily to track these updates. This ensures that our image benefits from the latest security patches and improvements in the base ClamAV image.

Upon a successful build, the image is pushed to the GitHub Container Registry, ensuring it's readily available for deployment.

see the build-main.ymal for detail deep dive into what is happening with the image build.

