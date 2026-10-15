import type {MetadataRoute} from 'next';
export default function sitemap():MetadataRoute.Sitemap{const base='https://zco.edunavigator.co.in';return ['','about','services','projects','products','blog','gallery','faqs','contact','consultation'].map(path=>({url:`${base}/${path}`,lastModified:new Date()}))}
