interface CardProps {
  title: string;
  description: string;
  image: string;
  x?: string;
  y?: string;
  href?: string;
}

export default function Card({ title, description, image, x = "center", y = "center", href }: CardProps) {
  const content = (
    <div className="group relative aspect-square overflow-hidden rounded-2xl flex flex-col items-start justify-end p-5">
      <div
        className="absolute inset-0 transition-transform duration-300 group-hover:scale-110"
        style={{
          backgroundImage: `url('${image}')`,
          backgroundPosition: `${x} ${y}`,
          backgroundSize: "cover",
        }}
      />
      <div className="absolute inset-0 bg-linear-to-b from-transparent to-black" />
      <p className="relative text-white font-semibold z-10 font-number mb-2">{title}</p>
      <p className="relative text-[#ccc] z-10">{description}</p>
    </div>
  );

  if (href) {
    return (
      <a href={href} className="block">
        {content}
      </a>
    );
  }

  return content;
}
