import {
  Card,
  CardAction,
  CardDescription,
  CardFooter,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import DeleteMateriDialog from "@/components/delete-materi-dialog";

interface MateriCardProps {
  id: number;
  title: string;
  description: string;
  image: string;
  alt: string;
  badge: string;
  href?: string;
  buttonText?: string;
  admin?: boolean;
}

export default function MateriCard({
  id,
  title,
  description,
  image,
  alt,
  badge,
  href = "#",
  buttonText = "Pelajari",
  admin = false,
}: MateriCardProps) {
  return (
    <Card className="relative mx-auto w-full md:max-w-sm pt-0 flex flex-col">
      <img src={image} alt={alt} className="relative z-20 aspect-video w-full object-cover" />
      <CardHeader>
        <CardAction>
          <Badge variant="secondary">{badge}</Badge>
        </CardAction>
        <CardTitle>{title}</CardTitle>
        <CardDescription className="text-base line-clamp-3">{description}</CardDescription>
      </CardHeader>
      <CardFooter className="mt-auto flex flex-col w-full gap-2">
        <a href={href} className="w-full">
          <Button className="w-full">{buttonText}</Button>
        </a>
        {admin == true && (
          <div className="flex w-full gap-2">
            <a href={`/app/editor?id=${id}`} className="w-full">
              <Button className="w-full" variant="outline">
                Edit
              </Button>
            </a>
            <div className="w-full">
              <DeleteMateriDialog id={id} title={title} />
            </div>
          </div>
        )}
      </CardFooter>
    </Card>
  );
}
