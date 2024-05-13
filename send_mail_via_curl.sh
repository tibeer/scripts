cat <<EOF | curl -s smtp://mailhog.mail.svc.cluster.local --mail-from tibeer@tibeer.de --mail-rcpt \
tibeer@tibeer.de --upload-file -
From: Tim Beermann <tibeer@tibeer.de>
To: Admin User <tibeer@tibeer.de>
Subject: Test mailhog from command line with curl
Date: Mon, 01 Jan 2024 12:00:00

Hello, world!
EOF
