import { Suspense } from "react"
import Loading from "@/components/loading"
import Webpanel from "@/components/webpanel"

export default function WebGUI() {
    return (
        <Suspense fallback={<Loading />}>
            <Webpanel />
        </Suspense>
    )
}