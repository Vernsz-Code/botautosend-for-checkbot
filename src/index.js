const { Client, LocalAuth } = require('whatsapp-web.js');
const readline = require('readline');
const cron = require('node-cron');
const qrcode = require('qrcode-terminal');
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
let messageIndex = 0;

const askTableName = () => {
    rl.question('Pilih Shift. Ketik pagi/sore/malam: ', (tableName) => {
        if (tableName === "pagi") {
            table = "shift_pagi";
        } else if (tableName === "sore") {
            table = "shift_siang";
        } else if (tableName === "malam") {
            table = "shift_malam";
        } else {
            console.log("Invalid input!");
            rl.close();
            process.exit(1);
        }
        rl.close();
        startProcess();
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

const fetchMessagesToSend = () => {
    const now = new Date();
    const oneMinuteAgo = new Date(now.getTime() - 60000);
    const adjustedNow = new Date(now.getTime() + 7 * 60 * 60 * 1000);
    const adjustedOneMinuteAgo = new Date(oneMinuteAgo.getTime() + 7 * 60 * 60 * 1000);

    const formattedNow = adjustedNow.toISOString().slice(0, 19).replace('T', ' ');
    const formattedOneMinuteAgo = adjustedOneMinuteAgo.toISOString().slice(0, 19).replace('T', ' ');

    const numbers = ["samplenumber", "6285664914563"];

    db.query(`SELECT * FROM ${table} WHERE waktu > ? AND waktu <= ?`, [formattedOneMinuteAgo, formattedNow], (err, results) => {
        if (err) {
            console.error('Error fetching messages:', err);
            return;
        }

        results.forEach(row => {
            const selectedMessage = messages[messageIndex];
                sendMessage(numbers[1], selectedMessage);
            messageIndex = (messageIndex + 1) % messages.length;
        });
    });
};

const startProcess = () => {
    client.on('ready', () => {
        console.log('Client is ready!');

        cron.schedule('* * * * *', () => {
            console.log('Checking for messages to send at', new Date().toLocaleString());
            fetchMessagesToSend();
        });
    });

    client.on('qr', (qr) => {
        qrcode.generate(qr, { small: true });
        console.log('QR Code generated. Please scan with your WhatsApp.');
    });

    client.initialize();
};
