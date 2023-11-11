import Link from 'next/link'
import Image from 'next/image'
import JmpLogoRound from '@/public/images/j-mp_icon_noBG.png'

export default function WebpanelHeader() {
    return(
    <header className="absolute w-full z-30">
      <div className="max-w h-16 mx-auto px-4 sm:px-6 bg-gradient-to-r from-purple-800 to-purple-500">
        <div className="flex items-center h-full">
          {/* Site branding */}
          <div className="shrink-0 mr-4 mb-1">
            {/* Logo */}
            <Link href="/" className="block" aria-label="Cruip">
              <Image className="rounded-full" src={JmpLogoRound} width={48} height={48} alt="J-mp logo" />
            </Link>
          </div>
          <div className="shrink-0 mr-4">
            <h2 className="h2 center font-bold">J-mp WebGUI</h2>
          </div>

          {/* Desktop navigation */}
          <nav className="hidden md:flex md:grow">
            {/* Desktop sign in links */}
            <ul className="flex grow justify-end flex-wrap items-center">
              <li>
                <Link href="/webpanel" className="btn-sm text-white ml-1 bg-purple-600 hover:bg-purple-500">
                  Create Challenge
                </Link>
              </li>
              <li>
                <div className="border-solid border-2 border-white-500 hover:border-gray-400 ml-3">
                  <Link href="/" className="btn-sm text-white hover:bg-gray-400">
                    Back
                  </Link>
                </div>
              </li>
            </ul>
          </nav>
        </div>
      </div>
    </header>
    )
}