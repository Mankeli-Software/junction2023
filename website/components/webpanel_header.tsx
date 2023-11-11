import Link from 'next/link'
import Image from 'next/image'
import JmpLogoRound from '@/public/images/j-mp_icon_noBG.png'

export default function WebpanelHeader() {
    return(
    <header className="absolute w-full z-30 ">
      <div className="max-w mx-auto px-4 sm:px-6 bg-purple-700">
        <div className="flex items-center h-full">
          {/* Site branding */}
          <div className="shrink-0 mr-4">
            {/* Logo */}
            <Link href="/" className="block" aria-label="Cruip">
              <Image className="rounded-full" src={JmpLogoRound} width={48} height={48} alt="J-mp logo" />
            </Link>
          </div>
          <div className="shrink-0 mr-4">
            <h1 className="h1 center font-bold">J-mp WebGUI</h1>
          </div>

          {/* Desktop navigation */}
          <nav className="hidden md:flex md:grow">
            {/* Desktop sign in links */}
            <ul className="flex grow justify-end flex-wrap items-center">
              <li>
                <Link href="/" className="btn-sm text-white bg-purple-600 hover:bg-purple-700 ml-3">
                  Back
                </Link>
              </li>
            </ul>
          </nav>
        </div>
      </div>
    </header>
    )
}