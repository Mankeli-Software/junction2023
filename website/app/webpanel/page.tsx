export const metadata = {
    title: 'J-mp webpanel',
    description: 'Junior Movement Platform Webpanel',
  }

import { Suspense } from "react"
import Loading from "@/components/loading"
import WebpanelHeader from "@/components/webpanel_header"
import Webpanel from "@/components/webpanel"

export default function WebGUI() {
    return (
        <>
            <Suspense fallback={<Loading />}>
                <Webpanel />
            </Suspense>
        </>
    )
}