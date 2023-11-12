import Image from 'next/image'
import MapBG from '@/public/images/map.png'


export default function Webpanel() {
    return (
        <div className="h-screen relative">
            <Image className="z-0 h-screen object-cover object-center layout-fill" src={MapBG} alt="MapBG" />
        </div>
    )
}