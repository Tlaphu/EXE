const fs = require('fs');

const htmlPath = 'd:/EXE/breatree.html';
const contentPath = 'd:/EXE/clean_content.txt';

const html = fs.readFileSync(htmlPath, 'utf8');
const cleanContent = fs.readFileSync(contentPath, 'utf8');

const startTag = '<!-- BEGIN: Packaging Section -->';
const endTag = '<!-- END: Instructions Section -->';

const startIndex = html.indexOf(startTag);
const endIndex = html.indexOf(endTag) + endTag.length;

if (startIndex === -1 || endIndex === -1) {
    console.error('Could not find tags');
    process.exit(1);
}

const newHtml = html.substring(0, startIndex) + cleanContent + html.substring(endIndex);

fs.writeFileSync(htmlPath, newHtml, 'utf8');
console.log('Successfully updated breatree.html');
