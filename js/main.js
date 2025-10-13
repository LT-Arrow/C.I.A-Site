document.addEventListener('DOMContentLoaded', function() {

  // Helper to convert Markdown/JSON entry to HTML
  function createEntryHTML(entry) {
    const div = document.createElement('div');
    div.className = "entry";
    div.innerHTML = `
      <h3>${entry.title}</h3>
      ${entry.classification ? `<p><strong>Classification:</strong> ${entry.classification}</p>` : ""}
      ${entry.tier ? `<p><strong>Tier:</strong> ${entry.tier}</p>` : ""}
      ${entry.level ? `<p><strong>Containment Level:</strong> ${entry.level}</p>` : ""}
      ${entry.status ? `<p><strong>Status:</strong> ${entry.status}</p>` : ""}
      ${entry.camera ? `<p><strong>Camera ID:</strong> ${entry.camera}</p>` : ""}
      ${entry.entity ? `<p><strong>Observed Entity:</strong> ${entry.entity}</p>` : ""}
      <p>${entry.body || entry.notes || ""}</p>
    `;
    return div;
  }

  // Containers
  const directivesContainer = document.getElementById('directives-container');
  const watchlogsContainer = document.getElementById('watchlogs-container');
  const containmentContainer = document.getElementById('containment-container');

  // --- Fetch CMS JSON data dynamically ---
  const collections = [
    { folder: 'directives', container: directivesContainer },
    { folder: 'watchlogs', container: watchlogsContainer },
    { folder: 'containment_logs', container: containmentContainer }
  ];

  collections.forEach(col => {
    fetchCollection(col.folder, col.container);
  });

  async function fetchCollection(folder, container) {
    try {
      // GitHub raw URLs for Markdown files
      // Example: https://raw.githubusercontent.com/<username>/<repo>/main/<folder>/<file>.md
      // For simplicity, we’ll assume an index.json is exported by CMS with metadata
      const response = await fetch(`/${folder}/index.json`);
      const entries = await response.json();
      entries.forEach(entry => {
        container.appendChild(createEntryHTML(entry));
      });
    } catch (err) {
      console.error(`Failed to load ${folder}:`, err);
      const fallback = document.createElement('p');
      fallback.textContent = `No entries found in ${folder}.`;
      container.appendChild(fallback);
    }
  }
});

