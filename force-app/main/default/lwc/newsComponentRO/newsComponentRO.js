import { LightningElement, api } from 'lwc';

export default class NewsComponentRO extends LightningElement {

  @api newsArticles;

  connectedCallback() {
    
    console.log('newsArticlesCompo='+(this.newsArticles)); 
  }

}