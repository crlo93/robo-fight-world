﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UpdateGPSText : MonoBehaviour {

	public Text coordinates;

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		coordinates.text = "Lat GAY:" + GPS.Instance.latitude.ToString () + "\nLon GAY:" + GPS.Instance.longitude.ToString();
	}


}
