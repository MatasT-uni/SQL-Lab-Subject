using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.Button;

namespace Lab02
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        public static string firstName = "";
        public static string lastName = "";
        public static string group = "";
        public static string title = "";

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void cbBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void bt1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form2 f2 = new Form2();
            f2.ShowDialog();
        }

        private void bt2_Click(object sender, EventArgs e)
        {

        }

        private void bt3_Click(object sender, EventArgs e)
        {

        }

        private void bt4_Click(object sender, EventArgs e)
        {

        }

        private void txtBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox6_TextChanged(object sender, EventArgs e)
        {

        }

        private void rBT1_CheckedChanged(object sender, EventArgs e)
        {
            group = "";
        }

        private void rBT2_CheckedChanged(object sender, EventArgs e)
        {
            group = "";
        }

        private void rBT3_CheckedChanged(object sender, EventArgs e)
        {
            group = "";
        }

        private void smBT_Click(object sender, EventArgs e)
        {
            title = cbBox1.Text;
            firstName = txtBox1.Text;
            lastName = txtBox2.Text;
            if (rBT1.Checked)
            {
                group = rBT1.Text;
            }
            if (rBT2.Checked)
            {
                group = rBT2.Text;
            }
            if (rBT3.Checked)
            {
                group = rBT3.Text;
            }
            this.Hide();
            Form2 f2 = new Form2();
            f2.ShowDialog();
        }
    }
}