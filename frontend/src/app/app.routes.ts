import { Routes } from '@angular/router';
import { CategoryListing } from './product/category-listing/category-listing';
import { ProductListing } from './product/product-listing/product-listing';

export const routes: Routes = [
    {
        path: "categories",
        component: CategoryListing
    },
    {
        path: "products",
        component: ProductListing
    },
];
