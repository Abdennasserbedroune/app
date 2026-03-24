/**
 * download_fonts.js
 * Kitchen Companion — Font Asset Downloader (cross-platform Node.js)
 * Run: node scripts/download_fonts.js
 * Requires Node.js 18+ (uses native fetch)
 */

const fs   = require('fs')
const path = require('path')
const https = require('https')

const DEST = path.join(__dirname, '..', 'entry', 'src', 'main', 'resources', 'rawfile', 'fonts')

const FONTS = [
  {
    name: 'PlayfairDisplay-Bold.ttf',
    url:  'https://raw.githubusercontent.com/google/fonts/main/ofl/playfairdisplay/PlayfairDisplay%5Bwght%5D.ttf'
  },
  {
    name: 'DMSerifDisplay-Regular.ttf',
    url:  'https://raw.githubusercontent.com/google/fonts/main/ofl/dmserifdisplay/DMSerifDisplay-Regular.ttf'
  },
  {
    name: 'DMSans-Regular.ttf',
    url:  'https://raw.githubusercontent.com/google/fonts/main/ofl/dmsans/DMSans%5Bopsz%2Cwght%5D.ttf'
  },
  {
    name: 'DMSans-Medium.ttf',
    url:  'https://raw.githubusercontent.com/google/fonts/main/ofl/dmsans/DMSans%5Bopsz%2Cwght%5D.ttf'
  },
]

function download(url, dest) {
  return new Promise((resolve, reject) => {
    const file = fs.createWriteStream(dest)
    const get = (u) => https.get(u, (res) => {
      if (res.statusCode === 301 || res.statusCode === 302) {
        return get(res.headers.location)
      }
      if (res.statusCode !== 200) {
        return reject(new Error(`HTTP ${res.statusCode} for ${u}`))
      }
      res.pipe(file)
      file.on('finish', () => file.close(resolve))
    }).on('error', reject)
    get(url)
  })
}

async function main() {
  fs.mkdirSync(DEST, { recursive: true })
  console.log(`Downloading fonts to ${DEST}\n`)
  for (const { name, url } of FONTS) {
    const dest = path.join(DEST, name)
    await download(url, dest)
    const size = fs.statSync(dest).size
    console.log(`✓  ${name} — ${size.toLocaleString()} bytes`)
  }
  console.log('\n✅  All 4 fonts ready.')
}

main().catch(e => { console.error(e); process.exit(1) })
