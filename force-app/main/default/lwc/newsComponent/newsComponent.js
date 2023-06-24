import { LightningElement, track, api } from 'lwc';
import  getNewsArticles  from '@salesforce/apex/NewsApiHelper.getNewsArticles';

export default class NewsComponent extends LightningElement {

  @api searchTerm;
  @track newsArticles;
  @track fromDate;

  connectedCallback() {

    const currentDate = new Date();
    currentDate.setMonth(currentDate.getMonth() - 1);       // 1 month ago
    const year = currentDate.getFullYear();
    const month = String(currentDate.getMonth() + 1).padStart(2, '0');
    const day = String(currentDate.getDate()).padStart(2, '0');
    this.fromDate = `${year}-${month}-${day}`;

    if(this.searchTerm && this.fromDate){

       this.fetchNewsArticles();
    }    
  }

  fetchNewsArticles() {

    getNewsArticles({ searchTerm: this.searchTerm, fromDate: this.fromDate })
        .then(result => {
            if(result){

              let resObj = JSON.parse(result);

              if(resObj.articles.length>10){
                this.newsArticles = resObj.articles.slice(0, 9);
              }
              else{
                this.newsArticles = resObj.articles;
              }
              
            }
        })
        .catch(error => {
            console.error(error);
        });
}

}