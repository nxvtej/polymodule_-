const fs = require('fs');
const path = require('path');
console.log(__dirname);

// Imports the nfts array from a separate file
const nfts = require('./nfts');

for (let k = 0; k < nfts.length; k++) {

  // Creates a JSON object for each NFT
  const json = {
    name: nfts[k].name,
    description: nfts[k].description,
    image: `https://gateway.pinata.cloud/ipfs/${nfts[k].image}`,
  };
  const name = nfts[k].name;

  // Replaces any non-alphanumeric characters in the name with an empty string for the filename
  const fileName = `${name.replace(/[^a-zA-Z0-9]/g, '')}`;

  // Writes the JSON object to a file
  fs.writeFileSync(
    path.join(__dirname, 'nftcollection', String(fileName)),
    JSON.stringify(json)
  );
}

// run node metadata/generateNftData.js