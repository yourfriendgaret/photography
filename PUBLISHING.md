# Publishing the website

The site lives in two places once it's set up:

- **GitHub** stores the files. You add or remove photos there, from any computer, in a web browser.
- **Netlify** publishes them. Every time something changes on GitHub, Netlify rebuilds the photo list and updates the live site, usually within a minute.

Both are free for a site like this.

---

## One-time setup

### 1. Create a GitHub account and a place for the site

1. Go to https://github.com/signup and create an account.
2. Once signed in, click the **+** in the top right, then **New repository**.
3. Name it something like `photography`. Leave everything else as it is and click **Create repository**.

### 2. Upload the site

1. On the new repository's page, click the **uploading an existing file** link.
2. Open the `WEBSITE` folder on your computer and drag these into the browser window:
   - `index.html`
   - `photos.js`
   - `build.sh`
   - `netlify.toml`
   - the `MEDIA` folder
3. Don't upload `ORIGINALS` (its file is too large for GitHub) or `.claude` (it's only used by Claude). `PUBLISHING.md` is optional.
4. Scroll down and click **Commit changes**.

If dragging the `MEDIA` folder doesn't work, use Chrome or Firefox. Safari sometimes won't accept folders.

### 3. Connect Netlify

1. Go to https://app.netlify.com/signup and choose **Sign up with GitHub**.
2. Choose **Add new project**, then **Import an existing project**, then **GitHub**.
3. Allow Netlify to see your repositories when it asks, then pick `photography`.
4. Netlify reads its settings from `netlify.toml`, so you don't need to change anything. Click **Deploy**.
5. After a minute it shows your site's address, something like `random-name-123.netlify.app`.

To get a nicer address, open **Project configuration** and choose **Change project name**. For example, `garet-edwards` gives you `garet-edwards.netlify.app`. To use your own domain such as `yourname.com`, open **Domain management** in Netlify and follow its steps. The domain itself costs about $10–20 a year.

---

## Adding photos (from any computer)

1. Sign in at https://github.com and open your `photography` repository.
2. Click the `MEDIA` folder.
3. Click **Add file**, then **Upload files**, and drag in your photos.
4. Click **Commit changes**.

The live site updates on its own about a minute later.

### Naming controls the order

Photos appear in filename order, and numbers are compared as numbers, so `2.jpg` comes before `10.jpg`.

- To add a photo at the end, give it the next number, such as `13.jpg`.
- To put a photo between two others, add letters after the number. For example, `7b.jpg` goes between `7.jpg` and `8.jpg`.

### File size

GitHub's upload page accepts files up to 25 MB. Export photos as JPEGs around 3000–4000 pixels on the long side. That keeps them well under the limit and still looks sharp on large screens. Netlify automatically makes a smaller copy for each visitor's screen, so phones don't download the full file.

---

## Removing or reordering photos

- **Remove:** in `MEDIA`, click the photo, then the **…** menu in the top right, then **Delete file**, then **Commit changes**.
- **Reorder:** GitHub can't rename photos in the browser. Delete the photo and upload it again with a new name.

---

## If something goes wrong

- **The site didn't update:** in Netlify, open **Deploys**. Each upload creates an entry. A red one has failed; click it to see why.
- **A photo doesn't appear:** check that it's directly inside `MEDIA` (not in a folder within it) and ends in `.jpg`, `.jpeg`, `.png`, `.webp`, `.avif` or `.gif`.

---

## Previewing on this computer

Double-click `index.html` to open the site in your browser. It shows the photos listed in `photos.js`. If you add photos to `MEDIA` on this computer and want to see them here before uploading, open Terminal in the `WEBSITE` folder and run `sh build.sh` to refresh the list. Netlify does this step itself when publishing.
