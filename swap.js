const fs = require('fs');
const file = 'index.html';
let html = fs.readFileSync(file, 'utf8');

const offeringsRegex = /(  <!-- OFFERINGS -->\n(?:.*?\n)*?  <\/section>\n)/;
const processRegex = /(  <!-- PROCESS -->\n(?:.*?\n)*?  <\/section>\n)/;

const offeringsMatch = html.match(offeringsRegex);
const processMatch = html.match(processRegex);

if (offeringsMatch && processMatch) {
    const offeringsHtml = offeringsMatch[1];
    const processHtml = processMatch[1];
    
    // They are separated by one newline: offeringsHtml + "\n" + processHtml
    const originalCombo = offeringsHtml + "\n" + processHtml;
    const newCombo = processHtml + "\n" + offeringsHtml;
    
    if (html.includes(originalCombo)) {
        html = html.replace(originalCombo, newCombo);
        fs.writeFileSync(file, html);
        console.log("Success");
    } else {
        console.log("Combo not found strictly due to newlines, trying targeted split replace...");
        // Fallback split replace
        const parts = html.split(originalCombo);
        if (parts.length === 2) {
             html = parts[0] + newCombo + parts[1];
             fs.writeFileSync(file, html);
             console.log("Success fallback");
        } else {
             // Let's replace the whole text from <!-- OFFERINGS --> to the end of <!-- PROCESS -->
             const startIndex = html.indexOf('  <!-- OFFERINGS -->');
             const endText = '  </section>\n';
             let processIndex = html.indexOf('  <!-- PROCESS -->');
             let processEndIndex = html.indexOf(endText, processIndex) + endText.length;
             
             let fullBlock = html.substring(startIndex, processEndIndex);
             let replaced = fullBlock.replace(offeringsHtml, '').replace(processHtml, '').replace(/\n+/g, '\n');
             
             let finalStr = processHtml + '\n' + offeringsHtml;
             html = html.replace(fullBlock, finalStr);
             fs.writeFileSync(file, html);
             console.log("Success forced");
        }
    }
} else {
    console.log("Could not find blocks.");
}
