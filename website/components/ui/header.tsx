import Link from 'next/link'
import MobileMenu from './mobile-menu'
import Image from 'next/image'
import JmpLogoRound from '@/public/images/j-mp_icon_noBG.png'
import AppStore from '@/public/images/App_store_button.png'
import GooglePlay from '@/public/images/Google_play_button.png'

export default function Header() {
  return (
    <header className="absolute w-full z-30">
      <div className="max-w-6xl mx-auto px-4 sm:px-6">
        <div className="flex items-center justify-between h-20">
          {/* Site branding */}
          <div className="shrink-0 mr-4">
            {/* Logo */}
            <Link href="/" className="block" aria-label="Cruip">
              <Image className="rounded-full" src={JmpLogoRound} width={48} height={48} alt="Testimonial 01" />
            </Link>
          </div>
          <div className="shrink-0 mr-4">
            <p className="flex justify-end font-bold italic">J-mp</p>
          </div>

          {/* Desktop navigation */}
          <nav className="hidden md:flex md:grow">
            {/* Desktop sign in links */}
            <ul className="flex grow justify-end flex-wrap items-center">
              <li>
                <Link href="https://youtu.be/dQw4w9WgXcQ?si=ETn2YjQIgkxEVDSc" className="">
                  <Image className="full" src={GooglePlay} width={135} height={135} alt="Google Play" />
                </Link>
              </li>
              <li>
                <Link href="https://youtu.be/dQw4w9WgXcQ?si=ETn2YjQIgkxEVDSc" className="">
                  <Image className="full" src={AppStore} width={120} height={120} alt="App Store" />
                </Link>
              </li>
            </ul>
          </nav>

          <MobileMenu />

        </div>
      </div>
    </header>
  )
}
