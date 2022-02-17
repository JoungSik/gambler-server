import { Controller } from "@hotwired/stimulus";
import Chart from 'chart.js/auto';

export default class ChartController extends Controller {
  static targets = ['count', 'history'];
  static values = {
    success: 0,
    failure: 0,
    histories: []
  }

  connect() {
    const histories = this.historiesValue;

    new Chart(this.countTarget.getContext('2d'), {
      type: 'pie',
      data: {
        labels: ['성공', '파산'],
        datasets: [{
          data: [this.successValue, this.failureValue],
          backgroundColor: ['rgba(255, 0, 0, 0.2)', 'rgba(0, 0, 255, 0.2)',]
        }]
      },
      options: {
        layout: { autoPadding: true },
        responsive: true,
        plugins: { legend: { position: 'top' }, title: { display: true, text: '도박 시도' } }
      }
    });

    new Chart(this.historyTarget.getContext('2d'), {
      type: 'bar',
      data: {
        labels: Array(histories.length).fill().map((i, index) => `${index + 1}회`),
        datasets: [
          {
            label: '세금',
            data: histories.map(history => history.tax),
            backgroundColor: "#0000FF",
            type: 'line',
            order: 0
          },
          {
            label: '남은 금액',
            data: histories.map(history => history.total),
            backgroundColor: "#FF0000"
          },
        ]
      },
      options: {
        layout: { autoPadding: true },
        responsive: true,
        scales: { x: { stacked: true }, y: { stacked: true } },
        plugins: { legend: { position: 'top' }, title: { display: true, text: '도박 결과' } }
      },
    });
  }
}