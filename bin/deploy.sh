aws s3 cp ./dist/assets/ s3://yawna-flagrant-web/css/ --cache-control "public, max-age=31536000" --recursive
aws s3 cp ./dist/favicon.ico s3://yawna-flagrant-web/ --cache-control "public, max-age=86400"
aws s3 cp ./dist/index.html s3://yawna-flagrant-web/index.html --cache-control "no-cache, no-store, must-revalidate"
aws s3 cp ./dist/assets/*.css s3://yawna-flagrant-web/assets/ --cache-control "public, max-age=31536000" --content-type "text/css"
aws s3 cp ./dist/assets/*.js s3://yawna-flagrant-web/assets/ --cache-control "public, max-age=31536000" --content-type "text/javascript"
aws s3 cp ./dist/assets/flags s3://yawna-flagrant-web/assets/flags --cache-control "public, max-age=31536000" --content-type "image/svg+xml" --recursive
