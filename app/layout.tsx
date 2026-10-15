import type { Metadata } from 'next'; import './globals.css';
export const metadata:Metadata={title:'ZCO EDU NAVIGATOR | Education Consultancy',description:'ZCO EDU NAVIGATOR — professional education consultation and guidance for students in India.',metadataBase:new URL('https://zco.edunavigator.co.in')};
export default function RootLayout({children}:{children:React.ReactNode}){return <html lang="en"><body>{children}</body></html>}
