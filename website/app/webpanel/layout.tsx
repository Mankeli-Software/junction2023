'use client'

import { useEffect } from 'react'

import AOS from 'aos'
import 'aos/dist/aos.css'

import WebpanelHeader from '@/components/webpanel_header'
import Footer from '@/components/ui/footer'

export default function WebpanelLayout({
  children,
}: {
  children: React.ReactNode
}) {  

  useEffect(() => {
    AOS.init({
      once: true,
      disable: 'phone',
      duration: 600,
      easing: 'ease-out-sine',
    })
  })

  return (
    <>
      <WebpanelHeader />
      <main className="grow">

        {children}

      </main>

      <Footer />
    </>
  )
}
