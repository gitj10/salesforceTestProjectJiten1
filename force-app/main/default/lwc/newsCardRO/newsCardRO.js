import { LightningElement, api } from 'lwc';

export default class NewsCardRO extends LightningElement {
    @api article;
    newsData={};

    connectedCallback() {
        
        this.newsData = this.article;
    }

    get formattedDate() {
        const options = { year: 'numeric', month: 'long', day: 'numeric', hour: 'numeric', minute: 'numeric' };
        const publishedAt = new Date(this.newsData.publishedAt);
        return publishedAt.toLocaleDateString('en-NZ', options);
    }
}