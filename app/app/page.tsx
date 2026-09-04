import { redirect } from "next/navigation";

// /app has no content of its own — send users straight to the editor
// (the editor layout still enforces login on the target).
export default function AppIndex() {
  redirect("/app/editor");
}
