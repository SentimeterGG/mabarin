/**
 * Shared `<figure>`-style wrapper for markdown images rendered via
 * `dangerouslySetInnerHTML` (editor preview + materi reading page).
 *
 * Images start in a skeleton state (pulsing placeholder, img at opacity 0)
 * and reveal when the browser fires `load`/`error` on the `<img>`. Inline
 * handlers are used because the HTML is injected as a string, where React
 * props like `onLoad` cannot attach.
 */
export function markdownImageFigure(
  src: string,
  alt: string,
  title?: string | null,
): string {
  const titleAttr = title ? ` title="${escapeHtmlAttr(title)}"` : "";
  return (
    `<div class="md-img bg-white rounded-lg p-4">` +
    `<img src="${escapeHtmlAttr(src)}" alt="${escapeHtmlAttr(alt)}"${titleAttr} ` +
    `onload="this.closest('.md-img').classList.add('is-loaded')" ` +
    `onerror="this.closest('.md-img').classList.add('is-loaded')" /></div>\n`
  );
}

export function escapeHtmlAttr(value: string): string {
  return value
    .replace(/&/g, "&amp;")
    .replace(/"/g, "&quot;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;");
}
