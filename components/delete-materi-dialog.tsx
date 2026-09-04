"use client";

import { Button } from "@/components/ui/button";
import {
  Dialog,
  DialogClose,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog";
import { deleteMaterial } from "@/app/app/editor/actions";

interface DeleteMateriDialogProps {
  id: number;
  title: string;
}

export default function DeleteMateriDialog({ id, title }: DeleteMateriDialogProps) {
  return (
    <Dialog>
      <DialogTrigger asChild>
        <Button className="w-full" variant="destructive">
          Hapus
        </Button>
      </DialogTrigger>
      <DialogContent className="sm:max-w-sm">
        <DialogHeader>
          <DialogTitle>Hapus materi?</DialogTitle>
          <DialogDescription>
            &quot;{title}&quot; akan dihapus permanen dan tidak bisa dikembalikan.
          </DialogDescription>
        </DialogHeader>
        <DialogFooter>
          <DialogClose asChild>
            <Button variant="outline">Batal</Button>
          </DialogClose>
          <form action={deleteMaterial.bind(null, id)}>
            <Button variant="destructive" type="submit">
              Ya, hapus
            </Button>
          </form>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  );
}
