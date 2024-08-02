const { Client, LocalAuth } = require('whatsapp-web.js');
const readline = require('readline');
const cron = require('node-cron');
const qrcode = require('qrcode-terminal');
const numbers = ["sample number"];
const messages = [
    "Format Patrol Check #7 Mesin #7",
    "Format Patrol Check #8 Mesin #8",
    "Format Patrol Check #9 Mesin #9",
];
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

let table;
let manualFetch;
let messageIndex = 0;

const askTableName = () => {
    rl.question('Pilih Shift. Ketik pagi/sore/malam/manual/custom: ', (tableName) => {
        if (tableName === "pagi") {
            table = "shift_pagi";
        } else if (tableName === "sore") {
            table = "shift_siang";
        } else if (tableName === "malam") {
            table = "shift_malam";
        } else if (tableName === "custom") {
            table = "custom";
        } else if (tableName === "manual") {
            rl.question('Input Menit: ', (minutes) => {
                table = "manual";
                manualFetch = minutes;
                rl.close();
                startProcess2();
            });
            return;
        } else {
            console.log("Invalid input!");
            rl.close();
            process.exit(1);
        }
        rl.close();
        startProcess1();
    });
};

const client = new Client({
    puppeteer: { headless: false },
    authStrategy: new LocalAuth({ clientId: "ID_CLIENT" })
});

const db = require('./utils/connection');

db.connect(err => {
    if (err) {
        console.error('Error connecting to MySQL:', err);
        return;
    }
    console.log('Connected to MySQL database.');
    askTableName();
});

const sendMessage = (number, message) => {
    client.sendMessage(`${number}@c.us`, message).then(response => {
        console.log(`Message sent successfully to ${number}:`, response);
    }).catch(err => {
        console.error(`Error when sending message to ${number}:`, err);
    });
};
const formatTime = (date) => {
    const hours = String(date.getUTCHours()).padStart(2, '0');
    const minutes = String(date.getUTCMinutes()).padStart(2, '0');
    const seconds = String(date.getUTCSeconds()).padStart(2, '0');
    return `${hours}:${minutes}:${seconds}`;
};

const fetchMessagesToSend = () => {
    const now = new Date();
    const oneMinuteAgo = new Date(now.getTime() - 60000);
    const adjustedNow = new Date(now.getTime() + 7 * 60 * 60 * 1000);
    const adjustedOneMinuteAgo = new Date(oneMinuteAgo.getTime() + 7 * 60 * 60 * 1000);

    const formattedNow = formatTime(adjustedNow);
    const formattedOneMinuteAgo = formatTime(adjustedOneMinuteAgo);

    console.log(formattedNow, formattedOneMinuteAgo)
    db.query(`SELECT * FROM ${table} WHERE waktu > ? AND waktu <= ?`, [formattedOneMinuteAgo, formattedNow], (err, results) => {
        if (err) {
            console.error('Error fetching messages:', err);
            return;
        }
        results.forEach(row => {
            const selectedMessage = messages[messageIndex];
            sendMessage(numbers[0], selectedMessage);
            messageIndex = (messageIndex + 1) % messages.length;
        })
    });
};

const startProcess1 = () => {
    client.on('ready', () => {
        console.log('Client is ready!');

        cron.schedule('* * * * *', () => { // Run every minute
            console.log('Checking for messages from sp1 to send at', new Date().toLocaleString());
            fetchMessagesToSend();
        });
    });

    client.on('qr', (qr) => {
        qrcode.generate(qr, { small: true });
        console.log('QR Code generated. Please scan with your WhatsApp.');
    });

    client.initialize();
};

const startProcess2 = () => {
    client.on('ready', () => {
        console.log('Client is ready!');

        cron.schedule(`*/${manualFetch} * * * *`, () => {
            console.log('Checking for messages from sp2 to send at', new Date().toLocaleString());
            const selectedMessage = messages[messageIndex];
             console.log("ini dari sp2")
            sendMessage(numbers[0], selectedMessage);
            messageIndex = (messageIndex + 1) % messages.length;
        });
    });

    client.on('qr', (qr) => {
        qrcode.generate(qr, { small: true });
        console.log('QR Code generated. Please scan with your WhatsApp.');
    });

    client.initialize();
};
