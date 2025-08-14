# EthStorageTrusted Ceremony Setup

![Image 8-14-25 at 10 46 AM](https://github.com/user-attachments/assets/6f3455d4-c23d-4ff9-a608-a67ae5b87ae5)


## Detailed guide to participate in EthStorage trusted ceremony setup

### what's EthStorage?

EthStorage is a Layer 2 storage rollup solution built on top of Ethereum, aiming to provide programmable, dynamic storage with significantly reduced costs. By periodically submitting storage proofs from the EthStorage Layer 2 network to Ethereum L1, it enhances Ethereum's storage capacity while benefiting from its security features.

## Requirements for this ceremony;

- PC: Mac, Linux and VPS supported.
- Fast Internet Connection with at least 10mb/s.
  
###  Github Account that meets the requirements below ⬇️:

- At least a month old.
- At least one public repository.
- At least following 5 GitHub accounts and have at least 1 follower.
- Must allow the ceremony tools to read and write GitHub Gists on your account.

### How to contribute:

### - Step 1: clone and Run this script:
```
git clone https://github.com/bigray0x/EthStorage-TCS.git && cd EthStorage-TCS
```

### - Step 2: make the script executable
```
chmod +x tsc_script.sh && ./tsc_script.sh
```

### - Step 3: sign into github to contribute by following the screen prompts:

- A: sign into github using the link on the terminal.
- B: input the code you're given on he terminal.
- C: return to the terminal after successfully signing in to proceed.
<img width="1440" height="316" alt="Screenshot 2025-08-14 at 1 24 13 PM" src="https://github.com/user-attachments/assets/5ab6eca0-1ed1-4305-97ca-91ae468aa0a5" />

### - Step 4: choose to contribute to start the process:

- A: you can enter any random input or hit enter to proceed with automatic input.
- B: screen session will be created for you automatically to save progress if you choose to contribute.
- C: once you're on the queue you can detach the screen to save progress and the contribution will happen automatically.

### - Step 5: Finish & Logout

- After completing your contribution to the ceremony, it’s recommended to clean up your local files and revoke GitHub authorization for security:
```
phase2cli clean
phase2cli logout
```

- Delete the ceremony folder too if you don’t need it:
```
rm -rf ~/EthStorage-TCS
```

### Screen commands from 0xmoei:

Minimize screen: ```Ctrl+A+D```
Return to screen: ```screen -r ceremony```
Kill ceremony when inside screen: ```Ctrl+C```
Kill screen when inside screen: ```Ctrl+D```
Kill screen when outside screen: ```screen -XS ceremony quit```
screens list: ```screen -ls```


### FAQs:

- is this a node?: no this is not a node and doesn't function like one.
- can i minimise and check back later?: yes you can,using VPS is recommended.
- i'm using VPS, how can i access my VPS ip to login to my Github?: install chromium here - https://github.com/bigray0x/chromium-setup-guide.git
- use the chromium to open the github link and login, input the code given to proceed.
- windows user?: install WSL here - https://x.com/bigray0x/status/1938208586070388803.

