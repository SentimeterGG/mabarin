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

interface MateriCardProps {
  title: string;
  description: string;
  image: string;
  alt: string;
  badge: string;
  href?: string;
  buttonText?: string;
}

export default function MateriCard({
  title,
  description,
  image,
  alt,
  badge,
  href = "#",
  buttonText = "Pelajari",
}: MateriCardProps) {
  return (
    <Card className="relative mx-auto w-full md:max-w-sm pt-0 flex flex-col">
      <img
        src={image}
        alt={alt}
        className="relative z-20 aspect-video w-full object-cover"
      />
      <CardHeader>
        <CardAction>
          <Badge variant="secondary">{badge}</Badge>
        </CardAction>
        <CardTitle>{title}</CardTitle>
        <CardDescription className="text-base">{description}</CardDescription>
      </CardHeader>
      <CardFooter className="mt-auto">
        <a href={href} className="w-full">
          <Button className="w-full">{buttonText}</Button>{" "}
        </a>
      </CardFooter>
    </Card>
  );
}
