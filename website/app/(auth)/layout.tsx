import Header from '@/components/ui/header'
import PageIllustration from '@/components/page-illustration'

export default function AuthLayout({
  children,
}: {
  children: React.ReactNode
}) {  
  return (
    <main className="grow">

      <Header />
      <PageIllustration />

      {children}

    </main>
  )
}
